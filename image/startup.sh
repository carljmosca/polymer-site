#!/bin/bash
set -e

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-apache}:x:$(id -u):0:${USER_NAME:-apache} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi


#git clone "$GIT_URL" app
#cd app/$GIT_DIRECTORY
#polymer build
#cp -R build/* /var/www/html/

#/sbin/apachectl

tail -f /dev/null