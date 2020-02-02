#!/bin/sh

IFS=';' read -ra NAMES <<< "$BACKUPDB_NAMES"

wget https://raw.githubusercontent.com/AnilKumarBandi27/postgres-scripts/master/restore-script.py

for i in "${NAMES[@]}"; do
   export BACKUP_FILE=$i;
   python restore-script.py
   export FILE=${i%%-*}
   cat databackup.sql | PGPASSWORD=$POSTGRES_PASSWORD psql -h $SERVICE_IP -U $POSTGRES_USER -d $FILE
   rm -rf databackup.sql
done
