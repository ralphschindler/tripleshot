#!/bin/bash

apt-add-repository -k hkp://ha.pool.sks-keyservers.net:80 -y ppa:ondrej/php
curl -sL https://deb.nodesource.com/setup_9.x | bash -
DEBIAN_FRONTEND=noninteractive \
    apt-get install -qqy --no-install-recommends \
    git \
    php7.1-cli \
    php7.1-xdebug \
    php7.1-common \
    php7.1-fpm \
    php7.1-zip \
    php7.1-mbstring \
    php7.1-mysql \
    php7.1-imagick \
    php7.1-gd \
    php7.1-mcrypt \
    php7.1-curl \
    php7.1-pgsql \
    php7.1-xml \
    php7.1-sqlite \
    php7.1-pgsql \
    php7.1-bcmath \
    ca-certificates \
    nginx \
    nodejs
apt-get clean 
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
