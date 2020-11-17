#!/bin/bash
WP_NAME=domain.com
WP_PATH=/var/www/domain.com/htdocs
DIR_PATH=/var/www/domain.com
SFTP_HOST=0.0.0.0
SFTP_USER=sftp
SFTP_PASS=password
SFTP_PATH=/home/sftp

DB_NAME=$WP_NAME-$(date +"%Y%m%d")
TAR_NAME=$WP_NAME-$(date +"%Y%m%d")

cd /var/www/backup
wp db export --allow-root $DB_NAME.sql --path=$WP_PATH
tar zcfP $TAR_NAME.tar.gz $DIR_PATH

lftp -u $SFTP_USER,$SFTP_PASS sftp://$SFTP_HOST << END
cd $SFTP_PATH
put $DB_NAME.sql
put $TAR_NAME.tar.gz
bye
END

rm -rf $DB_NAME.sql
rm -rf $TAR_NAME.tar.gz
