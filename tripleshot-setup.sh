#!/bin/bash

cd /tripleshot-install
cp .bashrc /root/.bashrc
cp php.ini /etc/php/7.1/fpm/php.ini
cp php.ini /etc/php/7.1/cli/php.ini
cp xdebug.ini /etc/php/7.1/mods-available/xdebug.ini
cp php-fpm.conf /etc/php/7.1/fpm/php-fpm.conf
cp nginx.conf /etc/nginx/sites-available/default
cp bootstrap.sh /usr/local/bin/bootstrap-web
cp runit-nginx.sh /usr/local/bin/runit-nginx
cp runit-phpfpm.sh /usr/local/bin/runit-phpfpm
cd /
rm -Rf /tripleshot-install

phpdismod -v 7.1 -s ALL xdebug
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local
mv /usr/local/composer.phar /usr/local/bin/composer
mkdir /tripleshot
