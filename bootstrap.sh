#!/bin/bash

# Production vs. Development
if [ "$APP_ENV" != "production" ]; then
    phpdismod -v 7.1 -s ALL newrelic
    phpenmod -v 7.1 -s ALL xdebug
fi

# PHP FPM Service
mkdir -p /etc/service/php-fpm
cp /usr/local/bin/runit-phpfpm /etc/service/php-fpm/run

# Nginx Service
mkdir -p /etc/service/nginx
cp /usr/local/bin/runit-nginx /etc/service/nginx/run

exec /sbin/my_init