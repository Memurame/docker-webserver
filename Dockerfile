# Dockerfile
FROM debian:stretch-slim

RUN apt-get update && apt-get install -y gnupg2
RUN apt install -y ca-certificates apt-transport-https
RUN apt-get install -y wget curl
RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -
RUN echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list

RUN apt-get update && apt-get --allow-unauthenticated install -y \
  apache2 \
  zip \
  unzip \
  php7.3 \
  php7.3-cli \
  php7.3-gd \
  php7.3-common \
  php7.3-curl \
  php7.3-mbstring \
  php7.3-mysql \
  php7.3-xml \
  php7.3-zip \
  php7.3-intl \
  php7.3-pdo \
  php7.3-apcu \
  && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite headers
RUN a2ensite default-ssl && a2enmod ssl

COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY php.ini /etc/php/7.3/apache2/php.ini
COPY lite_php_browscap.ini /etc/php/7.3/apache2/browscap.ini

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

EXPOSE 80 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
