#!/usr/bin/env bash

echo "$(date)"
ssh suek-nfs-clu02 'rm -rfv /var/nfs/*' && echo -e '\nSUCCES remove of /var/nfs/*\n' && 
echo -e 'Starting new sync...\n' && cd "$(dirname "$0")" && ./nfs_sync.sh
