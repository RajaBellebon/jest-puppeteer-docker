#!/bin/sh

# Taken from https://github.com/bufferings/docker-access-host/blob/master/docker-entrypoint.sh
###
HOST_DOMAIN="host.docker.internal"
ping -q -c1 $HOST_DOMAIN > /dev/null 2>&1
if [ $? -ne 0 ]; then
  HOST_IP=$(ip route | awk 'NR==1 {print $3}')
  echo -e "$HOST_IP\t$HOST_DOMAIN" >> /etc/hosts
fi
###

# Taken from https://github.com/alpeware/chrome-headless-trunk/blob/master/start.sh
###
# Run the NSSDB updating utility in background
import_cert.sh $HOME &

CHROME_ARGS="--disable-gpu --headless --no-sandbox --remote-debugging-address=$DEBUG_ADDRESS --remote-debugging-port=$DEBUG_PORT --user-data-dir=/data --disable-dev-shm-usage"

if [ -n "$CHROME_OPTS" ]; then
  CHROME_ARGS="${CHROME_ARGS} ${CHROME_OPTS}"
fi

# Start Chrome
sh -c "/usr/bin/google-chrome-unstable $CHROME_ARGS"
###