# Set nginx base image
FROM nginx

# File Author / Maintainer
MAINTAINER Andre Prado

# Add static files
COPY static/ /var/www

# Copy custom configuration file from the current directory
COPY nginx.conf /etc/nginx/nginx.conf
