#!/usr/bin/env bash

set -e

CLEAN="cover_db upstream working"

for d in $CLEAN; do
    if [ -d "$d" ]; then
        echo "Removing $d..."
        rm -rf "$d"
    fi
done

