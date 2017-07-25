#!/usr/bin/env bash

echo "$(date)"
/usr/bin/rsync -chavz /var/nfs/ suek-nfs-clu02.moscow.eurochem.ru:/var/nfs/
