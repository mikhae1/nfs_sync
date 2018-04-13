#!/usr/bin/env bash

# General lib for nfs_sync

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ENV_PATH="${ENV_FILE:-$CWD/env}"


init_dotenv() {
  if [[ -f "$ENV_PATH" ]]; then
    set -a
      source "$ENV_PATH"
    set +a
  fi
}

log() {
  echo -e "\n[$(date +'%Y-%m-%d %H:%M:%S%z')]: $@"
}

timer_start() {
  stimer=$(date +%s)
}

timer_end() {
  etimer=$(date +%s)

  log "duration: $(( ($etimer - $stimer)/60 )) minutes"
}

timer_start
init_dotenv
