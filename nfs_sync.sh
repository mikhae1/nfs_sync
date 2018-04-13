#!/usr/bin/env bash

# Syncing dirs between NFS cluster nodes (master-slave)

# Don't edit this file!
# all variables should be initialized by
#  1. env file at the Current Working Directory
#  2. process environemnt

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/lib.sh"

###############################################################################
# $SRC_PATH/$DIR will be rsynced to $DST_PATH/$DIR
DIR="${DIR}"
SRC_PATH="${SRC_PATH:-/var/nfsshare}"
DST_PATH="${DST_PATH:-$SRC_PATH}"
DST_HOST="${DST_HOST:-localhost}"

RSYNC_OPTS="${RSYNC_OPTS:--hav}"

# global timeout
TIMEOUT=${TIMEOUT:-36000}

# lock file will be created during sync
LOCK_DIR="${LOCK_DIR:-/tmp}"
default_lock_file="${LOCK_DIR}/nfs_sync_${DIR//\//-}.lock"
LOCK_FILE="${LOCK_FILE:-$default_lock_file}"
###############################################################################

rsync_cmd="timeout ${TIMEOUT} rsync ${RSYNC_OPTS} ${SRC_PATH}/${DIR}/ ${DST_HOST}:${DST_PATH}/${DIR}/"
log "$rsync_cmd"
flock -n "$LOCK_FILE" -c "$rsync_cmd" && log "success!"

timer_end
