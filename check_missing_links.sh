#!/bin/bash

function check_arguments {
    if [ "$#" - ne 1 ];  then 
        echo "Provide path that you want to test"
    fi
}

function check {
    RC=0
    if check_arguments; then
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
    else 
        exit 1
}

check $1