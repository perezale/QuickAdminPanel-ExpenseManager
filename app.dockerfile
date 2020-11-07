FROM php:7.4-fpm
RUN apt-get update
RUN apt-get install -y libpq-dev \
    libpng-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql gd

RUN docker-php-ext-install calendar && docker-php-ext-configure calendar

RUN usermod -u 1000 www-data