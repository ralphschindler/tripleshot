#!/bin/bash

# move to build directory
cd /tripleshot-build

# move service a setup files to proper locations
cp .bashrc /root/.bashrc
cp php.ini /etc/php/7.2/fpm/php.ini
cp php.ini /etc/php/7.2/cli/php.ini
cp xdebug.ini /etc/php/7.2/mods-available/xdebug.ini
cp php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf
cp nginx.conf /etc/nginx/sites-available/default
cp bootstrap.sh /usr/local/bin/bootstrap-web
cp runit-nginx.sh /usr/local/bin/runit-nginx
cp runit-phpfpm.sh /usr/local/bin/runit-phpfpm

# remove the build directory
cd /
rm -Rf /tripleshot-build

# disable xdebug (by defualt, for production)
phpdismod -v 7.2 -s ALL xdebug

mkdir /tripleshot