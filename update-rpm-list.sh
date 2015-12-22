#!/bin/bash
#
# Use this script to update the list of potentially installed
# RPMs to check.
#

CLOUD_MEDIA_DIR=${1:-/srv/nfs/media/SUSE-OPENSTACK-CLOUD-6/}

if [[ ! -d $CLOUD_MEDIA_DIR ]]; then
    echo "Directory doesn't exist: $CLOUD_MEDIA_DIR" >&2
    exit 1
fi

find $CLOUD_MEDIA_DIR -name *.rpm |
    sed 's/.*\///; s/-[0-9.+A-Za-z_~]\+-[0-9.]\+\.\(x86_64\|noarch\)\.rpm$//' |
    sort \
> suse-openstack-cloud-rpm-list
