#!/bin/bash

# crontab -e:
# */5 * * * * source on-ip-change.sh mail -s "$HOST IP changed to $IP" email@addr.com

IP=`curl -s 'https://api.ipify.org' | uniq`
filepath="/dev/shm/current_external_ip"
cmd=$@;

function success() {
  echo $IP > $filepath;
  export IP;
  eval $cmd;
}

if [ ! -f "$filepath" ]; then
  success;
else
  if [ $IP != "$(cat $filepath)" ]
  then
    success;
  fi
fi
