#!/bin/sh

WP_PATH="/var/www/localhost/htdocs"

sleep 10

if [ ! -f $WP_PATH/wp-config.php ];
then
    wp config create --allow-root --dbhost=$MYSQL_HOST:3306 --dbname=$MYSQL_DATABASE --dbpass=$MYSQL_PASSWORD --dbuser=$MYSQL_USER --path=$WP_PATH
    wp core install --admin_email=$WP_ADMIN_MAIL --admin_password=$WP_ADMIN_PASSWORD --admin_user=$WP_ADMIN_NAME --allow-root --path=$WP_PATH --skip-email --title=$WP_TITLE --url=$DOMAIN_NAME
    wp user create --allow-root --path=$WP_PATH --role=author $WP_USER_NAME $WP_USER_MAIL --user_pass=$WP_USER_PASSWORD
    wp theme install astra --activate --allow-root --path=$WP_PATH
fi

if [ ! -d /run/php ];
then
    mkdir /run/php;
fi
