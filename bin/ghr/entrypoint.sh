#!/bin/sh
set -ex

gh_user=`echo $GITHUB_REPOSITORY | sed -e 's/\/.*//g'`
gh_repo=`echo $GITHUB_REPOSITORY | sed -e 's/.*\///g'`

revision=`git describe`
version=`echo $revision | cut -d "-" -f 1`.`echo $revision | cut -d "v" -f 2 | cut -d "-" -f 2`
release="_build/$MIX_ENV/rel/$APPLICATION"
archive="$APPLICATION-`echo $version | cut -d "v" -f 2`.tar.gz"

echo $revision > $release/REVISION
echo $version > $release/VERSION

tar -zcvf $archive -C $release .

ghr -v
sh -c "ghr -t $GITHUB_TOKEN -u $gh_user -r $gh_repo -n $version $version $archive"
