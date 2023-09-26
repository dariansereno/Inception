#!/bin/sh

openssl req -x509 -nodes -newkey rsa:4096 \
        -keyout /etc/ssl/private/cert-ssl.key \
        -out /etc/ssl/certs/cert-ssl.crt \
        -days 365 -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=$DOMAIN_NAME"
nginx -t
nginx -g "daemon off;"
