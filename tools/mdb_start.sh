#!/bin/bash

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS $db_name ;" > setup.sql

echo "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;" >> setup.sql

echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;" >> setup.sql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_root_pwd' ;" >> setup.sql

echo "FLUSH PRIVILEGES;" >> setup.sql

mysql -u root -p"$db_root_pwd"  < setup.sql

sleep 5

mysqladmin -u root -p"$db_root_pwd" shutdown
