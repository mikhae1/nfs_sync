#!/usr/bin/env bash

# Check if node is MASTER or SLAVE

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/lib.sh"

CLUSTER_IP="${CLUSTER_IP:-127.0.0.1}"

if ifconfig | grep --quiet "$CLUSTER_IP"; then
  echo 'OK: I am MASTER node'
  exit 0
else
  echo 'ERROR: I am NOT MASTER node' 1>&2
  exit 1
fi
