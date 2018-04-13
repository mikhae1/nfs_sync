#!/usr/bin/env bash

# Wrap nfs_sync.sh to make rsync delete files that have been deleted from the source folder

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RSYNC_OPTS="${RSYNC_OPTS:---delete -hav}" "$CWD/nfs_sync.sh"
