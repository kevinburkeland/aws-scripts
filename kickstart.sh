#!/bin/bash
apt update
apt dist-upgrade -y
apt install apache2 php php-mysql mysql-server -y
cd /tmp/
wget https://wordpress.org/latest.tar.gz
tar zxvf latest.tar.gz
mv /tmp/wordpress/* /var/www/html/
chown -R www-data:www-data /var/www/html
rm /var/www/html/index.html
systemctl start mysql
mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'thisisastrongpassword';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"
systemctl restart apache2
