FROM alpine:3.17

RUN apk update && apk upgrade
RUN apk add --no-cache \
    nginx \
    openssl \
    curl
COPY conf/default.conf /etc/nginx/http.d/default.conf
COPY entrypoint.sh /tmp
RUN chmod +x /tmp/entrypoint.sh
ENTRYPOINT [ "/tmp/entrypoint.sh" ]
