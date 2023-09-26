#!/bin/sh

openrc && touch /run/openrc/softlevel && /tmp/init-db.sh
exec mysqld_safe --datadir='/var/lib/mysql'
