#!/bin/sh
FILENAME="./ServiceConfg/EnvGlobalContainer/.env"

passGenerator(){
  rand=$(openssl rand -base64 32)
  echo "$rand"
}

echo "### MySQL Password Generator ###"
echo "### $(passGenerator) ###"
# shellcheck disable=SC2028
printf '%s\n'>> $FILENAME
echo 'MYSQL_PASSWORD="'$(passGenerator)'"' >> $FILENAME
#read -p "Press any key to continue..."