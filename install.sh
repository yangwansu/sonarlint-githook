#!/usr/bin/env bash

hook_scripts_dir=$(cd "$(dirname "$0")"; pwd)

. "$hook_scripts_dir"/common.sh

git_work_tree=$(git rev-parse --show-toplevel)

args=$@

if [ -z "${args}" ]; then
    args=('pre-push' 'pre-commit')
fi

target=()
for on in ${args[@]}; do
    target+=("$hook_scripts_dir"/hooks/$on)
done


for hook in "${target[@]}"; do
    basename=${hook##*/}
    local_script="$git_work_tree/.git/hooks/$basename"
    if test -f "$local_script"; then
        info skip: $basename hook already exists
    else


        info installing hook at: $local_script
        ln -s "$hook" "$local_script"
    fi
done
info " Sonarlint를 위한 모든 git hook 이 활성화되었습니다."
