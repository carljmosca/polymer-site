#!/bin/bash
set -e

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-apache}:x:$(id -u):0:${USER_NAME:-apache} user:/home/apache:/sbin/nologin" >> /etc/passwd
  fi
fi

cd 
git clone "$GIT_URI" app
cd app/$GIT_DIRECTORY
npm i
polymer build
cp -R build/* /var/www/html/

/sbin/apachectl

tail -f /dev/null