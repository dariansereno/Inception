FROM alpine:3.17

RUN apk update && apk upgrade
RUN apk add --no-cache mariadb-client php-fpm php-mysqli php81 wget curl

COPY conf/www.conf /etc/php81/php-fpm.d/www.conf
COPY entrypoint.sh tools/wp-config.sh /tmp
RUN chmod +x /tmp/entrypoint.sh /tmp/wp-config.sh
RUN mkdir /tmp/sources
COPY sources /tmp/sources

ENTRYPOINT ["/tmp/entrypoint.sh"]
