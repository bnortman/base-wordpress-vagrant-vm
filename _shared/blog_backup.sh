#!/bin/bash

# Set the date format, filename and the directories where your backup files will be placed and which directory will be archived.
NOW=$(date +"%Y-%m-%d-%H%M")
FILE="rposbowordpressrestoredemo.$NOW.tar"
BACKUP_DIR="/home/vagrant"
WWW_DIR="/var/www"

# MySQL database credentials
DB_USER="root"
DB_PASS="myrootpwd"
DB_NAME="wordpress"
DB_FILE="rposbowordpressrestoredemo.$NOW.sql"

# dump the wordpress dbs
mysql -u$DB_USER -p$DB_PASS --skip-column-names -e "select table_name from information_schema.TABLES where TABLE_NAME like 'wp_%';" | xargs mysqldump --add-drop-table -u$DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/$DB_FILE
#mysqldump -u$DB_USER -p$DB_PASS -$DB_NAME > $BACKUP_DIR/$DB_FILE

# archive the website files
tar -cvf $BACKUP_DIR/$FILE $WWW_DIR

# append the db backup to the archive
tar --append --file=$BACKUP_DIR/$FILE $BACKUP_DIR/$DB_FILE

# remove the db backup
rm $BACKUP_DIR/$DB_FILE

# compress the archive
gzip -9 $BACKUP_DIR/$FILE
