FROM php:8.1-cli-alpine

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# ref: https://stackoverflow.com/a/63579640/2496217
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

# Install PHP extensions
RUN install-php-extensions ldap

#COPY .  /app
#WORKDIR /app

#RUN composer install && composer dump-autoload

CMD [ "php", "-S", "0.0.0.0:8000", "-t", "/app" ]
