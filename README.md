# Using SonarLint  

-------- 

## 목적 

Git 에 Commit Push 시점에 SonarLint 를 이용하여 Code 내 숨겨진 Bug 또는 Smell 을 감지하여 

수정 하도록 원작자에 요청해 Code Quality 를 지속적으로 관리하게 한다.



## Install 

분석을 위해서  `sonarlint` command line tool을 이용한다.

http://www.sonarlint.org/commandline/

Git hook 의 install 을 위해서 `janosgyerik/sonarlint-git-hooks` 을 참고 했다.

https://github.com/janosgyerik/sonarlint-git-hooks

    {yourprojecthome}$ ./sonarlint/install.sh
       
    
    info: installing hook at: /Users/coupang/workspace/seller/.git/hooks/pre-push
    info: installing hook at: /Users/coupang/workspace/seller/.git/hooks/pre-commit
    info:  Sonarlint를 위한 모든 git hook 이 활성화되었습니다.

 
위와 같이 install 스크립트를 실행하면 git commit, push 시 `sonarlint` hook 이 발동한다.

만약 push 또는 commit 의 선택 적으로 적용하길 원한다면 아래와 같이 할 수 있다.

#### commit

    {yourprojecthome}$ ./sonarlint/install.sh pre-commit
       
#### push

    {yourprojecthome}$ ./sonarlint/install.sh pre-push
    

## Uninstall

부득이하게 sonarlint 를 꺼놓고자 한다면 uninstall 하라.

    workspace/seller$ ./sonarlint/uninstall.sh
    

## Setting Quality Profile 
    
현재 본 프로젝트에서는 coupang의 sonar server 내 Quality Profiles 을 사용한다.

서버를 설정하고 사용하고자 하는 Profile 을 선택해야한다.

### global.json 설정    
    
{home}/.sonarlint/conf/global.json

- sonarserver 를 지정한다. 1


    {yourprojecthome}$ mkdir -p ~/.sonarlint/conf
    {yourprojecthome}$ cp ./sonarlint/global.json.sample ~/.sonarlint/conf/global.json
    

- sonarserver 를 지정한다. 2

    
    $ vi ~/.sonarlint/conf/global.json     


### Profile 설정 

{yourprojecthome}/sonarlint.json


- 특별히 할것 없다. 눈으로 바두기만하자....(바두기?) 


## SonarLint Results
  
결과는 {yourprojecthome}/.sonarlint/sonarlint-report.html 에서 확인 가능하다.


## 잠시 중단하기 

때로는 수정하지 못하는 Code 가 발생 할 수 있다. 이때 `SKIPSONARLINT` 을 설정하여 hooks을 일시적으로 중단 할 수 있다.

    {yourprojecthome}$ SKIPSONARLINT=1 git commit ......

  

