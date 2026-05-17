#!/bin/bash

while true
do
  echo "alive $(date)" >> /tmp/keepalive.log

  curl -I https://github.com >/dev/null 2>&1

  sleep 240
done
