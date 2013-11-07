#!/bin/bash
#
# Use this script to update the list of potentially installed
# RPMs to check.
#

CLOUD_MEDIA_DIR=${1:-/srv/nfs/media/SUSE-CLOUD-3/}

[[ ! -d $CLOUD_MEDIA_DIR ]] && echo "Directory doesn't exist: $CLOUD_MEDIA_DIR" && exit 1

find $CLOUD_MEDIA_DIR -name *.rpm | sed 's/.*\///; s/-[0-9.+A-Za-z_]\+-[0-9.]\+\.\(x86_64\|noarch\)\.rpm$//' | sort > susecloud-rpm-list
