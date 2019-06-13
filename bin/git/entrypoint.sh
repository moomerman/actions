#!/bin/sh
set -ex

git --version
sh -c "git $*"
