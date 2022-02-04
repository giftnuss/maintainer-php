#!/usr/bin/env bash

#set -x
set -e

if [ ! -d working ]; then
    git clone https://github.com/thephpleague/climate.git working
fi

(
    cd working
    git fetch --all --tags --quiet
    git branch -a | grep -w v2.6.1 >/dev/null
    if [ $? -ne 0 ]; then
       git checkout tags/2.6.1 -b v2.6.1
    fi
)
