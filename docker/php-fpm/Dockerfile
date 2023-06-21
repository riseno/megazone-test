FROM --platform=linux/amd64 php:8.1-fpm-alpine

RUN apk add --update \
        php81-common \
        php81-redis \
        php81-mbstring \
        git \
        icu-dev \
        curl-dev \
        libpq-dev \
        libpng-dev \
        libxml2-dev \
        readline \
        libzip-dev \
        ffmpeg \
        flac \
        lame \
        openjdk8 \
        unzip \
        python3 \
        py3-virtualenv \
        openssl \
#        libexecinfo \
#    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install curl mysqli opcache gd intl xml zip pdo pdo_pgsql pgsql pdo_mysql

COPY opcache.ini /usr/local/etc/php/conf.d/opcache.ini

WORKDIR /var/www/html

CMD ["php-fpm"]

EXPOSE 9000