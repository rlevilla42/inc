#!/bin/bash
# sleep 10

mkdir -p /var/www/html
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

if ! ./wp-cli.phar core is-installed --allow-root  ; then
    ./wp-cli.phar core download --allow-root
    ./wp-cli.phar config create --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASS --dbhost=$MYSQL_HOST --allow-root --force
    ./wp-cli.phar core install --url=$WP_URL --title=$WP_BLOG_TITLE --admin_user=$WP_ADMIN_USER --admin_password=${WP_ADMIN_PASS} --admin_email=caca@gmail.com --allow-root
fi

if ./wp-cli.phar core is-installed --allow-root  ; then
    echo "Wordpress is installed and running"
else
    echo "Putaing"
fi
exec php-fpm7.4 -F