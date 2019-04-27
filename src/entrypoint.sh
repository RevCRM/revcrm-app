#!/bin/bash
set -e
if [ "$1" = 'odoo-start' ]; then
    shift
    exec odoo \
        "--db_host=$DB_HOST" \
        "--db_port=$DB_PORT" \
        "--db_user=$DB_USER" \
        "--db_password=$DB_PASSWORD" "$@"
else
    exec "$@"
fi