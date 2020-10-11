#!/usr/bin/env sh

# Install WordPress.
wp core install \
  --title="Damn Vulnerable WordPress" \
  --admin_user="admin" \
  --admin_password="admin" \
  --admin_email="admin@example.com" \
  --url="http://127.0.0.1:8081/" \
  --skip-email

# Install plugin remotely 
# <<< Add/Modify more vulneable plugins if you want >>>
wp plugin install iwp-client --version=1.9.4.4 --activate --allow-root
wp plugin install social-warfare --version=3.5.2 --activate --allow-root
wp plugin install wp-advanced-search --version=3.3.3 --activate --allow-root
wp plugin install wp-file-upload --version=4.12.2 --activate --allow-root
wp plugin install simple-file-list --version=4.2.2 --activate --allow-root 

# Update DB
wp db import dump.sql

