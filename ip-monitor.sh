
#!/bin/bash

ip=`curl -s http://www.ipchicken.com/ | awk '/[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*/ {print $1}' | uniq`
file="/dev/shm/ip.dat"

if [ ! -f "$file" ]; then
  # data file does not exist, create one and notify the user
  trigger_notification
else
  if [ $ip != "$(cat $file)" ]
  then
    # file already exists but ip doesn't match
    trigger_notification
  fi
fi

trigger_notification () {
  echo $ip > $file
  # you'll want to make sure to ssmtp is installed and configured
  # see http://www.nixtutor.com/linux/send-mail-with-gmail-and-ssmtp/
  echo "ip has changed to $ip" | mail -s "rpi - ip address $ip" email@addr.com
}