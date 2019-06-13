#!/bin/sh

mkdir /run/postgresql/

chown -R postgres /run/postgresql/
chown -R postgres "$PGDATA"

su-exec postgres initdb
sed -ri "s/^#(listen_addresses\s*=\s*)\S+/\1'*'/" "$PGDATA"/postgresql.conf

su-exec postgres pg_ctl -D "$PGDATA" -w start

psql postgres postgres -c "ALTER USER postgres WITH PASSWORD 'postgres';"

sh -c "mix $*"
