# Use the official PHP image with Apache
FROM php:8.1-apache

# Enable required PHP extensions (mysqli for MySQL)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy application to the container
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Ensure apache runs in foreground
CMD ["apache2-foreground"]
