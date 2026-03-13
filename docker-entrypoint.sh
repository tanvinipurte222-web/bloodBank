#!/bin/sh
set -e

# If Vercel/host provides a PORT environment variable, update Apache listen
if [ -n "$PORT" ]; then
  echo "Setting Apache to listen on port $PORT"
  # Update ports in apache config files
  sed -i "s/Listen 80/Listen $PORT/g" /etc/apache2/ports.conf || true
  sed -i "s/:80\">/:$PORT\">/g" /etc/apache2/sites-available/000-default.conf || true
fi

# Ensure document root permissions
chown -R www-data:www-data /var/www/html

# Start Apache in foreground
exec docker-php-entrypoint apache2-foreground
