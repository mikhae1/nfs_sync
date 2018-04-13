#!/usr/bin/env bash

# Check if node is MASTER or SLAVE

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/lib.sh"

MASTER_IP="${MASTER_IP:-127.0.0.1}"

if ip address list | grep --quiet "$MASTER_IP"; then
  echo "OK: I am MASTER node (master ip $MASTER_IP)"
  exit 0
else
  echo "ERROR: I am NOT MASTER node (master ip $MASTER_IP)" 1>&2
  exit 1
fi
