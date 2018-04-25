#!/bin/bash

# add php repository
apt-add-repository -k hkp://ha.pool.sks-keyservers.net:80 -y ppa:ondrej/php

# add node repository
curl -sL https://deb.nodesource.com/setup_9.x | bash -

# install apt-get packages
DEBIAN_FRONTEND=noninteractive \
    apt-get install -qqy --no-install-recommends \
    git \
    php7.2-bcmath \
    php7.2-cli \
    php7.2-common \
    php7.2-curl \
    php7.2-fpm \
    php7.2-gd \
    php7.2-imagick \
    php7.2-imap \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-pgsql \
    php7.2-sqlite \
    php7.2-xdebug \
    php7.2-xml \
    php7.2-zip \
    ca-certificates \
    nginx \
    nodejs \
    mysql-client \
    nano

# cleanup after one's self
apt-get clean 
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install php's composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local
mv /usr/local/composer.phar /usr/local/bin/composer
