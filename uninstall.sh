#!/usr/bin/env bash

hook_scripts_dir=$(cd "$(dirname "$0")"; pwd)

. "$hook_scripts_dir"/common.sh

git_work_tree=$(git rev-parse --show-toplevel)

uninstall() {
    for hook in "$hook_scripts_dir"/hooks/*; do
        basename=${hook##*/}
        local_script="$git_work_tree/.git/hooks/$basename"
        if test -f "$local_script"; then
            $(rm $local_script)
            info rm : $local_script
        fi
    done
    info " Sonarlint를 위한 모든 git hook 이 꺼졌습니다."
}

uninstall