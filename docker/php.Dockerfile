FROM php:8.3-fpm-alpine

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_mysql mysqli

RUN echo 'memory_limit = 2048M' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini;