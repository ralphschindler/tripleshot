FROM phusion/baseimage:0.9.22

ENV TERM xterm-256color
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV PATH $PATH:/tripleshot/vendor/bin:/tripleshot/node_modules/.bin:/tripleshot
ENV APP_NAME tripleshot-app
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV APP_ENV production

EXPOSE 80

CMD /usr/local/bin/bootstrap-web

RUN apt-add-repository -k hkp://ha.pool.sks-keyservers.net:80 -y ppa:ondrej/php \
    && curl -sL https://deb.nodesource.com/setup_7.x | bash - \
    && DEBIAN_FRONTEND=noninteractive \
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
        nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY .bashrc /root/.bashrc
COPY php.ini /etc/php/7.1/fpm/php.ini
COPY php.ini /etc/php/7.1/cli/php.ini
COPY xdebug.ini /etc/php/7.1/mods-available/xdebug.ini
COPY php-fpm.conf /etc/php/7.1/fpm/php-fpm.conf
COPY nginx.conf /etc/nginx/sites-available/default

COPY bootstrap.sh /usr/local/bin/bootstrap-web
COPY runit-nginx.sh /usr/local/bin/runit-nginx
COPY runit-phpfpm.sh /usr/local/bin/runit-phpfpm

RUN phpdismod -v 7.1 -s ALL xdebug
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local && mv /usr/local/composer.phar /usr/local/bin/composer

RUN mkdir /tripleshot
WORKDIR /tripleshot
