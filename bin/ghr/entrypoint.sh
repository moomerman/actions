#!/bin/sh
set -ex

ghr -v
sh -c "ghr $*"
