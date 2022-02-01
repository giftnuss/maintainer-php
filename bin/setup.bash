#!/usr/bin/env bash

set -x
set -e

if [ ! -d upstream ]; then
    git clone https://gitlab.com/foodsharing-dev/foodsharing.git upstream
fi

if [ ! -d working ]; then
    git clone https://github.com/giftnuss/foodsharing.git working
fi

