#!/usr/bin/env bash

ROOTDIR=$(pwd)
TEMPLATES=${1:-templates}

trap 'echo "$(date -u --iso-8601=seconds)" - ERR - Something bad happened' ERR SIGTERM

printf "> \n"
for d in "$TEMPLATES"/*; do
    if [ -d "$d" ]; then
        printf "%s - INFO - Updating the files in template %s: \n" "$(date -u --iso-8601=seconds)" "$d"
        set +e
        # shellcheck disable=SC2015
        cd "$d" && nix flake init -t ../../common/ && cd "$ROOTDIR" || cd "$ROOTDIR"
        set -e
        printf "> \n"
    fi
done
