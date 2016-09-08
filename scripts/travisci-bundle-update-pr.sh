#!/bin/bash
set -ev

gem install travisci-bundle-update-pr
travisci-bundle-update-pr TravisCI travisci@travisci-bundle-update-pr.com
