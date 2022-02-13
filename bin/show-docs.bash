#!/usr/bin/env bash

set -x
set -e

jekyll="bundle exec ruby vendor/ruby/3.0.0/bin/jekyll"

$jekyll serve -s docs/ &

firefox http://127.0.0.1:4000/
