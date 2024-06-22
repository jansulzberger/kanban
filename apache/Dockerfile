#FROM php:8.3-apache
FROM arm64v8/php:8.3-apache

RUN apt-get update && apt-get install -y \
    		libfreetype-dev \
            libjpeg62-turbo-dev \
        libpng-dev

RUN docker-php-ext-install pdo pdo_mysql mysqli

RUN docker-php-ext-configure gd --with-freetype --with-jpeg && docker-php-ext-install -j$(nproc) gd




RUN a2enmod rewrite && a2enmod ssl && a2enmod socache_shmcb
RUN a2ensite default-ssl

WORKDIR /var/www/html