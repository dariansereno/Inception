FROM alpine:3.17
RUN apk update && apk upgrade
RUN apk update && apk upgrade
RUN apk add --no-cache \
    mariadb \
    mariadb-client \
    openrc
COPY conf/mariadb-server.cnf /etc/my.cnf.d
COPY entrypoint.sh /tmp
COPY tools/init-db.sh /tmp
RUN chmod +x /tmp/entrypoint.sh
RUN chmod +x /tmp/init-db.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]
