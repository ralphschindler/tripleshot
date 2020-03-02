#!/bin/bash

# move to build directory
cd /build

# move service a setup files to proper locations
cp bashrc.sh /root/.bashrc
cp php.ini-development /etc/php/7.4/fpm/php.ini
cp php.ini-development /etc/php/7.4/cli/php.ini
cp xdebug.ini /etc/php/7.4/mods-available/xdebug.ini
cp php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
cp nginx.conf /etc/nginx/sites-available/default
cp entrypoint.sh /usr/local/bin/entrypoint
cp bootstrap-web.sh /usr/local/bin/bootstrap-web
cp runit-nginx.sh /usr/local/bin/runit-nginx
cp runit-phpfpm.sh /usr/local/bin/runit-phpfpm

# remove the build directory
cd /
rm -Rf /build

# disable xdebug (by defualt, for production)
phpdismod -v 7.4 -s ALL xdebug

mkdir /app