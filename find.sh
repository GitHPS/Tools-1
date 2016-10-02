#!/bin/sh

WORKDIR=`dirname $0`
CONFIG_FILE=$WORKDIR/config.sh
[ -f $CONFIG_FILE ] && source $CONFIG_FILE


SQL="
select username, password from users where username = (
     select MEMBER_PRIMARY_EMAIL from idemail where 
            MEMBER_PRIMARY_EMAIL = '$1');
"

mysql -Dlnkin -u$MARIADBUSER -p$MARIADBPASSWORD -e "$SQL"
