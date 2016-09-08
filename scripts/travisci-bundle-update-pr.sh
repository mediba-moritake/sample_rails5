#!/bin/bash
set -ev

if [ "${TRAVIS_EVENT_TYPE}" = "cron" ]; then
    gem install travisci-bundle-update-pr
    travisci-bundle-update-pr TravisCI travisci@travisci-bundle-update-pr.com
fi
