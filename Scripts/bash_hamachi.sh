#!/bin/sh

# Name:
# -----
# bash_influx.sh

ID=`/usr/local/bin/docker ps | grep hamachi | cut -f1 -d" "`
/usr/local/bin/docker exec -it --user=root $ID /bin/bash
