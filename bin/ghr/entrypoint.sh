#!/bin/sh
set -ex

gh_user=`echo $GITHUB_REPOSITORY | sed -e 's/\/.*//g'`
gh_repo=`echo $GITHUB_REPOSITORY | sed -e 's/.*\///g'`

revision=`git describe --dirty --always --tags --first-parent --abbrev=1`
version=`echo $revision | cut -d "-" -f 1`.`git describe | cut -d "v" -f 2 | cut -d "-" -f 2`

echo $revision > $RELEASE/REVISION
echo $version > $RELEASE/VERSION

tar -zcvf $version.tar.gz $RELEASE

ghr -v
sh -c "ghr -t $GITHUB_TOKEN -u $gh_user -r $gh_repo -n $version $version $version.tar.gz"
