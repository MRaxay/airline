#!/bin/sh
echo "Installing MySQL, root access required."
apt install mysql-server-8.0 -y

sed -i 's/mysqlx-bind-address/#mysqlx-bind-address/' /etc/mysql/mysql.conf.d/mysqld.cnf 
sed -i 's/\nbind-address/\n#bind-address/' /etc/mysql/mysql.conf.d/mysqld.cnf 

echo "bind-address = 0.0.0.0" >> /etc/mysql/mysql.conf.d/mysqld.cnf 
echo "mysqlx-bind-address = 0.0.0.0" >> /etc/mysql/mysql.conf.d/mysqld.cnf
echo "character-set-server=utf8mb4" >> /etc/mysql/mysql.conf.d/mysqld.cnf

systemctl stop mysql
systemctl daemon-reload
systemctl start mysql
systemctl enable mysql

echo "Adding database and required user"
mysql -e "CREATE DATABASE airline;"
mysql -e "CREATE USER mfc@localhost IDENTIFIED by 'V5xY7n8yrTeWcgHj';"
mysql -e "GRANT ALL PRIVILEGES ON mysql.airline TO mfc@localhost;"
mysql -e "FLUSH PRIVILEGES;"


