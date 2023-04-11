# Download and Install the Latest Updates for the OS
#apt-get update && apt-get upgrade -y

# Set the Server Timezone to CST
echo "America/Bogota" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# Enable Ubuntu Firewall and allow SSH & MySQL Ports
ufw enable
ufw allow 22
ufw allow 3306

# Install essential packages
#apt-get -y install zsh htop

#mysqld_safe --skip-grant-tables --skip-networking & \
#mysql -u root

#echo "USE mysql; UPDATE mysql.user SET authentication_string = PASSWORD('toor') WHERE User = 'root' AND Host = 'localhost'; FLUSH PRIVILEGES;"
#<<-EOSQL || true
#				UPDATE mysql.user SET authentication_string = PASSWORD('toor') WHERE User = 'root' AND Host = 'localhost';
#			EOSQL

#root_password=toor
 
# Make sure that NOBODY can access the server without a password
#mysql -e "UPDATE mysql.user SET Password = PASSWORD('$root_password') WHERE User = 'root'"
#mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('toor');"
#mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('toor');"




# MySQL checker
if [ "$MYSQLCHK" = "on" ]; then
# Check if current password from /root/.my.cnf is works
if [ -f /root/.my.cnf ]; then
    passwd1=`grep ^password /root/.my.cnf| awk -F\= {'print $2'}|sed ':a;N;$!ba;s/\n//g'|sed 's/\"//g'|sed 's/[[:space:]]//g'`  # CPanel password in /etc/.my.cnf
    passwd2=`/bin/cat /root/.my.cnf |grep -i password |sed 's/[[:space:]]//g' |sed 's/password=//'` # Non-CPanel password in /etc/.my.cnf
   if [ -z "ls -lA /root |grep -i migration" ]; then 
     passwd=$passwd2
   else
     passwd=$passwd1 
   fi
fi
test=`mysql -u root -p$passwd -e "show databases;" -B|head -n1`
if [ "$test" = "Database" ]; then
password=$passwd
else
    #check pwd if works
    while [ "$check" != "Database" ]
    do
        echo "Enter MySQL root Password: "
        read -p "MySQL root password []:" password
        check=`mysql -u root -p$password -e "show databases;" -B|head -n1`
        if [ "$check" = "Database" ]; then
            echo "Password OK!!"
        else
            echo "MySQL root passwordis invalid!!!"
            echo "You can remove MySQL server using command: yum remove mysql"
            echo "after mysql is removed run installer again."
            echo ""
            echo "if exists you can check your mysql password in file: /root/.my.cnf"
            echo ""
            if [ -e "/root/.my.cnf" ]; then
                echo ""
                cat /root/.my.cnf
                echo ""
            fi
        fi
    done
fi
else
    password=$(</dev/urandom tr -dc A-Za-z0-9 | head -c12)
fi