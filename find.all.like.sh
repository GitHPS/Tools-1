#!/bin/sh

WORKDIR=`dirname $0`
CONFIG_FILE=$WORKDIR/config.sh
[ -f $CONFIG_FILE ] && source $CONFIG_FILE


SQL="
select username, password from users where username in (
     select MEMBER_PRIMARY_EMAIL from idemail where 
            MEMBER_PRIMARY_EMAIL like '%$1%');
"

function timer()
{
    if [[ $# -eq 0 ]]; then
        echo $(date '+%s')
    else
        local  stime=$1
        etime=$(date '+%s')

        if [[ -z "$stime" ]]; then stime=$etime; fi

        dt=$((etime - stime))
        ds=$((dt % 60))
        dm=$(((dt / 60) % 60))
        dh=$((dt / 3600))
        printf '%d:%02d:%02d' $dh $dm $ds
    fi
}

t=$(timer)
mysql -Dlnkin -u$MARIADBUSER -p$MARIADBPASSWORD -e "$SQL"
printf 'Query Elapsed Time: %s\n' $(timer $t)
