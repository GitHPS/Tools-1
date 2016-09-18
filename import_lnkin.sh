#!/bin/sh

# README 
#
# This script should run in the same directory where your downloaded txt files are placed.
#
# If mariadb is not installed, then follow this steps:
# 1) Using root or with sudo, install mariadb client and database.
#    dnf install mariadb mariadb-server
#
# 2) Start db engine
#    systemctl start mariadb
#
# 3) configure tour installation (define db root password and accept all others default options)
#    mysql_secure_installation
#
# 4) set this  script variable ( db user and db password)
#
# 5) run this script
#

# MariaDB user and password
MARIADBUSER=root
MARIADBPASSWORD=P4ssw0rd

#CREATE TABLE passwordhash (
#    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
#    userid VARCHAR(8) NOT NULL,
#    password CHAR(40),
#    CONSTRAINT \`fk_user_password\`
#        FOREIGN KEY (userid) REFERENCES idemail (id)
#        ON DELETE CASCADE
#        ON UPDATE RESTRICT
#) ENGINE = InnoDB;

# Database Schema

SQL="
DROP DATABASE IF EXISTS lnkin;
CREATE DATABASE lnkin;

USE lnkin;
CREATE TABLE idemail (
    MEMBER_ID VARCHAR(255) NOT NULL PRIMARY KEY,
    MEMBER_PRIMARY_EMAIL VARCHAR(255) 
) ENGINE = InnoDB;

CREATE TABLE passwordhash (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userid VARCHAR(255) NOT NULL,
    password VARCHAR(255)
) ENGINE = InnoDB;

CREATE VIEW users AS 
    SELECT idemail.MEMBER_PRIMARY_EMAIL AS username, passwordhash.password AS password FROM
        idemail INNER JOIN passwordhash ON idemail.MEMBER_ID = passwordhash.userid;  
"

clear
echo -e "Building Database structure for lnkin ... \n" 

# Build database structure
mysql -u$MARIADBUSER -p$MARIADBPASSWORD -e "$SQL"

# Insert into MariaDB all user email IDs 

echo -e "Importing email ids ... \n"
mysql -Dlnkin -u$MARIADBUSER -p$MARIADBPASSWORD < 1.sql.txt 

FILES="1.txt 2.txt 3.txt
4.txt 5.txt 6.txt 7.txt 8.txt 9.txt"

for f in $FILES
do
    echo -e "Importing password File: $f \n"
#   Convert from dos format, build sql string and run into MariaDB
    tr -d '\r' < $f | awk -F ":" '{print "insert into passwordhash(userid,password) values ('\''" $1 "'\'','\''" $2 "'\'');"; }' | mysql -Dlnkin -u$MARIADBUSER -p$MARIADBPASSWORD
done
