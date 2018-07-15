#!/bin/bash
set -e

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-apache}:x:$(id -u):0:${USER_NAME:-apache} user:/home/apache:/sbin/nologin" >> /etc/passwd
  fi
fi

export HOME=/home/apache

cd $HOME
echo "Cloning $GIT_URI"
git clone "$GIT_URI" app
cd app/$GIT_DIRECTORY
echo "Updating node modules..."
npm i
echo "Polymer build..."
polymer build
echo "Moving site..."
cp -R build/esm-bundled/* /var/www/html/
echo "Starting Apache..."
/sbin/apachectl
echo "Running"
tail -f /dev/null