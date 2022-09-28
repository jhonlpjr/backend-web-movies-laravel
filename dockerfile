# FROM php:7.4-apache

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     git \
#     curl \
#     libpng-dev \
#     libonig-dev \
#     libxml2-dev \
#     zip \
#     unzip

# # Clear cache
# RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# # Install PHP extensions
# RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# # 2. Apache configs + document root.
# RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
# RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
# RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# # 3. mod_rewrite for URL rewrite and mod_headers for .htaccess extra headers like Access-Control-Allow-Origin-
# RUN a2enmod rewrite headers

# # Get latest Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# #COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# # Create system user to run Composer and Artisan Commands
# # RUN useradd -G www-data,root -u $uid -d /home/$user $user
# # RUN mkdir -p /home/$user/.composer && \
# #     chown -R $user:$user /home/$user

# # # Set working directory
# # WORKDIR /var/www

# #CMD [ "php", "artisan", "serve" ]
# RUN chown -R www-data:www-data /var/www
# RUN chmod 755 /var/www

FROM php:7.4-fpm-alpine

# algunas configuraciones para que funcione el contenedor
RUN apk add --no-cache curl bash git vim nano
RUN apk add --no-cache composer 
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# da permisos para editar los archivos en esta ruta del container
RUN chown -R www-data:www-data /var/www
RUN chmod 755 /var/www
#WORKDIR /var/www/html/backend

#RUN composer update