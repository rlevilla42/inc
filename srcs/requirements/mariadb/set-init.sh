#!/bin/bash

# Check if environment variables are set
if [ -z "$MYSQL_DB" ] || [ -z "$MYSQL_USER" ] || [ -z "$MYSQL_PASS" ] || [ -z "$MYSQL_ROOT_PASS" ]; then
  echo "Error: Required environment variables are missing!"
  #exit 1
fi

# Generate the init.sql file using environment variables
cat << EOF > /etc/mysql/init.sql
CREATE DATABASE IF NOT EXISTS $MYSQL_DB;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;
--ALTER USER 'root'@'localhost' IDENTIFIED BY 'buakaw';
CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
FLUSH PRIVILEGES;
EOF

echo "init.sql created successfully with database: $MYSQL_DB and user: $MYSQL_USER"
exec mysqld