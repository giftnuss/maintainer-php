#!/usr/bin/env bash

set -e

mkdir -p cover_db

DIR=$(cd $(dirname ${BASH_SOURCE[0]})/.. && pwd)

(
  cd working
  php -dzend_extension=xdebug.so \
      -dxdebug.mode=coverage \
      ./vendor/bin/phpunit -c phpunit.xml \
          --verbose --debug \
          --coverage-html=../cover_db
)

firefox file://$DIR/cover_db/index.html &
