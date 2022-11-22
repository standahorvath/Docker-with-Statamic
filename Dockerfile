FROM php:7.2-fpm-stretch
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y zlib1g-dev libicu-dev g++ \
&& docker-php-ext-configure intl \
&& docker-php-ext-install intl
RUN apt-get update && apt-get install -y 
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-turbo-dev 
RUN apt-get install -y libmcrypt-dev 
RUN apt-get install -y libpng-dev 
RUN apt-get install -y git 
#install composer globally
RUN curl -sSL https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer
	
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
#RUN composer install --working-dir=/public/system --ignore-platform-reqs
SHELL ["/bin/bash", "composer install --working-dir=/public/system --ignore-platform-reqs"]