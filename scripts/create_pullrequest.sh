#!/bin/sh
set -e

export BRANCH=bundle_update_$(date -u "+%Y%m%d")

git config --global user.email travisci@mediba.jp
git config --global user.name 'TravisCI'
git add Gemfile.lock
git commit -m '$ bundle update'
git branch -M $BRANCH
git push origin $BRANCH

bundle exec ruby scripts/create_pullrequest.rb
