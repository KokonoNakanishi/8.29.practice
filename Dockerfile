FROM php:8.5-apache

# 必要なPHP拡張をインストール
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Apacheのドキュメントルートをpublicに設定
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

WORKDIR /var/www/html
