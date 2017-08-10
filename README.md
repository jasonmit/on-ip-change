# on-ip-change

If the script detects first time being run, or that the IP changed since last time it was run, the script will eval's any commands you pass in as arguments.  Otherwise results in a noop.

## Use

`source on-ip-change.sh mail -s "$HOST IP changed to $IP" email@addr.com`
