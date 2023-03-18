#!/usr/bin/env bash

set -e -x
set -eo pipefail

sudo zypper refresh && sudo zypper install jq yq ranger fzf


