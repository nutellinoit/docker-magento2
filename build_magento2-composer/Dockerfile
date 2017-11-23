FROM php:7.1-alpine

RUN apk --no-cache add curl git subversion openssh openssl mercurial tini bash zlib-dev icu-dev

RUN echo "memory_limit=-1" > "$PHP_INI_DIR/conf.d/memory-limit.ini" \
 && echo "date.timezone=${PHP_TIMEZONE:-UTC}" > "$PHP_INI_DIR/conf.d/date_timezone.ini"

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /tmp
ENV COMPOSER_VERSION 1.5.2

RUN curl -s -f -L -o /tmp/installer.php https://raw.githubusercontent.com/composer/getcomposer.org/da290238de6d63faace0343efbdd5aa9354332c5/web/installer \
 && php -r " \
    \$signature = '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410'; \
    \$hash = hash('SHA384', file_get_contents('/tmp/installer.php')); \
    if (!hash_equals(\$signature, \$hash)) { \
        unlink('/tmp/installer.php'); \
        echo 'Integrity check failed, installer is either corrupt or worse.' . PHP_EOL; \
        exit(1); \
    }" \
 && php /tmp/installer.php --no-ansi --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION} \
 && composer --ansi --version --no-interaction \
 && rm -rf /tmp/* /tmp/.htaccess

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN apk --no-cache add libpng-dev
RUN docker-php-ext-install gd
RUN docker-php-ext-configure intl --enable-intl
RUN docker-php-ext-install intl
RUN apk --no-cache add libmcrypt-dev
RUN docker-php-ext-install mcrypt
RUN apk --no-cache add libxslt-dev
RUN docker-php-ext-install xsl
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo pdo_mysql
RUN apk --nocache add libxml2-dev
RUN docker-php-ext-install soap
RUN docker-php-ext-install zip
RUN docker-php-ext-install mbstring
WORKDIR /app

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["composer"]