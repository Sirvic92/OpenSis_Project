# Use the official PHP Apache image
FROM php:8.2-apache

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy application files to the container
COPY . /var/www/html

# Set proper permissions for Apache
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Enable Apache mod_rewrite (if needed)
RUN a2enmod rewrite

# Install additional PHP extensions if needed (e.g., mysqli, pdo_mysql)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Expose port 80 for the web server
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]
