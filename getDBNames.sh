#!/bin/bash
IFS='-'
read -ra ADDR <<<"$str"
for i in "${ADDR[@]}";
do
#PGPASSWORD=$POSTGRES_PASSWORD pg_dump -h $SERVICE_IP   -U $POSTGRES_USER   -d  $1 > $1
echo $i
done
