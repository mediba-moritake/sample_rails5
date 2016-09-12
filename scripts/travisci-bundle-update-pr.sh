#!/bin/bash
set -ev

if [ "${TRAVIS_EVENT_TYPE}" = "push" ]; then
    gem install $TRAVIS_BUILD_DIR/pkg/travisci-bundle-update-pr-0.0.10.gem
    travisci-bundle-update-pr TravisCI travisci@travisci-bundle-update-pr.com
fi
