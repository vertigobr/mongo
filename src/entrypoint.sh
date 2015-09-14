#!/bin/bash
set -e

DBUSERUID=${DBUSERUID:-1000}
DBGROUPGID=${DBGROUPGID:-1000}

# check if user "mongodb"exists
ret=false
getent passwd mongodb >/dev/null 2>&1 && ret=true
if $ret; then
    echo "User mongodb exists"
else
    echo "User mongodb does not exist. Creating..."
    groupadd -g $DBGROUPGID -r mongodb
    useradd -g mongodb -u $DBUSERUID mongodb
fi

mkdir -p /data/db
chown -R mongodb:mongodb /data/db
echo "args $@"

exec su -- mongodb -c "$@"
