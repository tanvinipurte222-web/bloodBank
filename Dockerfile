# Use the official PHP image with Apache
FROM php:8.1-apache

# Enable required PHP extensions (mysqli for MySQL)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy application to the container
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Add entrypoint script which will update Apache to listen on $PORT
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Expose a port (informational)
EXPOSE 80

# Use entrypoint which adjusts Apache to the runtime PORT and starts Apache
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
