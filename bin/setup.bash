#!/usr/bin/env bash

set -x
set -e

if [ ! -d working ]; then
    git clone https://github.com/thephpleague/climate.git working
fi

(
    cd working
    git fetch --all --tags --quiet
    git checkout tags/2.6.1 -b v2.6.1
)

diff -ruN files/composer.json.orig files/composer.json |\
    patch working/composer.json

(
    cd working
    composer install
)

cp files/phpunit.xml working/

patch -p1 working/vendor/phpunit/php-token-stream/src/Token.php \
    <patches/add-new-tokens.patch

patch -p1 working/vendor/phpunit/php-code-coverage/src/CodeCoverage/Report/HTML/Renderer/File.php \
    <patches/prevent-count-null-exc.patch


