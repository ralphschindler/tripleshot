#!/bin/bash

# add php repository
apt-add-repository -k hkp://ha.pool.sks-keyservers.net:80 -y ppa:ondrej/php

# add node repository
curl -sL https://deb.nodesource.com/setup_12.x | bash -

# install apt-get packages
DEBIAN_FRONTEND=noninteractive \
    apt-get install -qqy --no-install-recommends \
    ca-certificates \
    crudini \
    git \
    libpng-dev \
    mysql-client \
    postgresql-client \
    nano \
    nginx \
    nodejs \
    php7.4-bcmath \
    php7.4-cli \
    php7.4-common \
    php7.4-curl \
    php7.4-fpm \
    php7.4-gd \
    php7.4-gmp \
    php7.4-imagick \
    php7.4-imap \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-pgsql \
    php7.4-redis \
    php7.4-sqlite \
    php7.4-xdebug \
    php7.4-xml \
    php7.4-zip \
    unzip \
    zip

# cleanup after one's self
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install php's composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local
mv /usr/local/composer.phar /usr/local/bin/composer