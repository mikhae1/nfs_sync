#!/usr/bin/env bash

echo "starting sync at: $(date)"
START=$(date +%s)

# use rsync -chavz for small amount of files
# use rsync -hav for large amount of files (make sure --checksum is not being used!)
/usr/bin/rsync -hav /var/nfsshare/ uds-nfs01.moscow.eurochem.ru:/var/nfsshare/

END=$(date +%s)
DIFF=$(( ($END - $START)/60 ))
echo "finsished sync at: $(date), it took $DIFF minutes"

