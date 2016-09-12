#!/bin/sh
set -e

if [ -z $(git status -s 2> /dev/null | grep Gemfile.lock) ]; then
  exit 0
fi

export BRANCH=bundle_update_$(date -u "+%Y%m%d")

git config --global user.email 'travisci@mediba.jp'
git config --global user.name 'TravisCI'
git init
git checkout -b $BRANCH
git add Gemfile.lock
git commit -m '$ bundle update'
git push --force --quiet "https://${GITHUB_ACCESS_TOKEN}@github.com/mediba-moritake/sample_rails5.git" $BRANCH:$BRANCH > /dev/null 2>&1

bundle exec ruby scripts/create_pullrequest.rb
