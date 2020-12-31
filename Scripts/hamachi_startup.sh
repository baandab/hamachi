#!/bin/bash

pwd

start_daemon(){
  echo "Starting daemon..."
  /etc/init.d/logmein-hamachi force-reload
  while [ 1 ]; do
    out=$(hamachi)
    [[ $out =~ .*version.* ]] && break || sleep 1
  done
  echo "daemon started..."
}

check_login(){
  echo "Logining in..."
  IFS=$'\n';
  regex_status="status.*?: (.*?)"
  regex_account="lmi account:(.*?)"
  for line in $(hamachi); 
  do
    if [[ $line =~ $regex_status ]]; then
      if [[ ${BASH_REMATCH[1]} == offline ]]; then
        while [ 1 ]; do
          out=$(hamachi login)
          [[ $out =~ ok ]] && break || sleep 1
        done
      fi
    fi
  done
  while [ 1 ]; do
    out=$(hamachi)
    [[ $out =~ "logging in" ]] && sleep 1
    [[ $out =~ "logged in" ]] && break
  done
  echo "Logged in..."
}


start_daemon
check_login

while pgrep hamachid >/dev/null; do
  sleep 10
done