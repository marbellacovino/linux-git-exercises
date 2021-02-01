#!/bin/bash
DIR="backup/marbellacovino/$(date +"%Y")/$(date +"%m")/$(date +"%d")"
TODAY="$(date +%w)"

if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo " ${DIR}..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  mkdir -p "$DIR"
  cp ~/nginx_requests_total.txt "$DIR"/nginx_requests_total_$(date +"%Y%m%d").txt 
  if [ "$TODAY" -eq 1 ]; then
   cd backup/marbellacovino/$(date +"%Y")/$(date +"%m")
   find . -name '*.txt' -mtime -6 | tar -zcvf nginx_logs_$(date +"%Y%m%d").tar.gz -T -
  fi
fi
