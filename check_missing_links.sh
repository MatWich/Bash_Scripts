#!/bin/bash

function check {
    if [[ "$#" -ne 1 ]]; then 
        echo "Provide path that need to be check"
        exit 1
    else 
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
}

check $1