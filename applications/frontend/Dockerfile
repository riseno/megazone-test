############################################
# Stage One.                               #
############################################
FROM --platform=linux/amd64 composer:latest as vendor

# copy required folders for laravel's autoload classmap.
COPY app/ app/
COPY config/ config/
COPY resources/ resources/
COPY storage/ storage/
COPY public/ public/
COPY bootstrap/ bootstrap/
COPY database/ database/
COPY routes/ routes/

# copy artisan
COPY artisan artisan

# copy composer files
COPY composer.json composer.json
COPY composer.lock composer.lock

# Install composer packages
RUN composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --prefer-dist

############################################
# Stage Three.                             #
############################################

FROM --platform=linux/amd64 php:8.1-fpm

RUN mkdir -p /var/www/source

COPY . /var/www/source
COPY --from=vendor /app/vendor /var/www/source/vendor/

WORKDIR /var/www/source
