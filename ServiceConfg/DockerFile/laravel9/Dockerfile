#
FROM php:8.1-fpm

#cargar pacquetes de php
RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd pdo pdo_mysql
	
#cargar paquetes para mysql y composer	
#RUN apt-get update && apt-get install -y libmcrypt-dev \
#    mysql-client libmagickwand-dev --no-install-recommends \
#    && pecl install imagick \
#    && docker-php-ext-enable imagick \
#	&& docker-php-ext-install mcrypt pdo_mysql

RUN apt-get update && apt-get install -y libmcrypt-dev \
    libmagickwand-dev --no-install-recommends

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN apt-get install unzip

RUN apt-get -y install nodejs npm

RUN composer global require laravel/installer

#COPY ../../../Sevice/www/laravel9 /var/www/html/laravel9
#WORKDIR /var/www/html/laravel9


EXPOSE 8002:8001