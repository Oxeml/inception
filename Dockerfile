FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/



COPY ./tools/mdb_start.sh /
RUN chmod +x /mdb_start.sh

EXPOSE 3306

CMD ["/mdb_start.sh"]

#some sources for understanding mariadb
# 1. initializing mariaDB
# https://mariadb.com/kb/en/mariadb-install-db/