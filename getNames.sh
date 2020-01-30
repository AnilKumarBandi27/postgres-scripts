#!/bin/sh

IFS=';' read -ra NAMES <<< "$DB_NAMES"

wget https://raw.githubusercontent.com/deekshahegde86/postgresql-operator-phases-1-2-3/master/scripts/backup/backup-script.py

for i in "${NAMES[@]}"; do
   PGPASSWORD=$POSTGRES_PASSWORD pg_dump -h $SERVICE_IP   -U $POSTGRES_USER   -d  $i > "$i-`date +"%d-%m-%Y"`.sql"
   export DB_NAME="$i-`date +"%d-%m-%Y"`.sql"
   python backup-script.py
   rm -rf DB_NAME
done
