# Download and Install the Latest Updates for the OS
apt-get update && apt-get upgrade -y

# Set the Server Timezone to CST
echo "America/Bogota" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# Enable Ubuntu Firewall and allow SSH & MySQL Ports
ufw enable
ufw allow 22
ufw allow 3306

# Install essential packages
apt-get -y install zsh htop

#mysqld_safe --skip-grant-tables --skip-networking &

#mysql -u root

#echo "USE mysql; UPDATE mysql.user SET authentication_string = PASSWORD('toor') WHERE User = 'root' AND Host = 'localhost'; FLUSH PRIVILEGES;"
#<<-EOSQL || true
#				UPDATE mysql.user SET authentication_string = PASSWORD('toor') WHERE User = 'root' AND Host = 'localhost';
#			EOSQL

root_password=toor
 
# Make sure that NOBODY can access the server without a password
mysql -e "UPDATE mysql.user SET Password = PASSWORD('$root_password') WHERE User = 'root'"
mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('toor');"
mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('toor');"