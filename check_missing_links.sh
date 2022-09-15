#!/bin/bash

SUCCESS=1
FAILED=0

function arguments_check {
    local RC=${SUCCESS}
    if [[ "$1" -ne 1 ]]; then 
        echo "Provide path that need to be check"
        echo "Example: ./check_broken_links.sh /opt"
        RC=${FAILED}
    fi
    return ${RC}
}

function check {
    if arguments_check "$#"; then
        exit 1
    fi

    for entry in $1/*; do 
        # echo "check $entry"
        if [ -d ${entry} ]; then
            check $entry
        else 
            if [ -L ${entry} ]; then
                target=$(readlink $"entry")
                if [ ! -e "$target" ]; then
                    echo "BROKEN LINK FROM $entry -> $target"
                fi
            fi
        fi
    done
}

check $1