#!/usr/bin/env bash

set -x
set -e

if [ ! -d docs ]; then
    git clone https://github.com/thephpleague/climate.git docs
    (
        cd docs
        git fetch --all --tags --quiet
        git checkout --track origin/gh-pages
        git checkout 7942cecbd1f08e356dfed8d
        git switch -c docs
    )
fi

cat >Gemfile <<EOT

source "https://rubygems.org"

gem "jekyll"
gem "webrick"

EOT

bundle config set --local path 'vendor'
bundle install

jekyll="bundle exec ruby vendor/ruby/3.0.0/bin/jekyll"

$jekyll build -s docs/ -d documentation/
