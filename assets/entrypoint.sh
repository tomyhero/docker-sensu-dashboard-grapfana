#!/bin/bash

set -e


ROOT_USER_NAME=${ROOT_USER_NAME:-root}
ROOT_PASSWORD=${ROOT_PASSWORD:-root}
ROOT_EMAIL=${ROOT_EMAIL:-example@example.com}

sed s/{{ROOT_USER_NAME}}/$ROOT_USER_NAME/g -i /app/assets/syncdb
sed s/{{ROOT_PASSWORD}}/$ROOT_PASSWORD/g -i /app/assets/syncdb
sed s/{{ROOT_EMAIL}}/$ROOT_EMAIL/g -i /app/assets/syncdb


if [ ! -d "/app/graphite/whisper" ]; then
    mkdir /app/graphite/whisper
    chown -R _graphite:_graphite /app/graphite/whisper
    echo "create whisper directory"
fi

rm -rf /var/lib/graphite/whisper
ln -s /app/graphite/whisper /var/lib/graphite/whisper

if [ ! -e "/app/graphite/whisper/graphite.db" ]; then
chmod 755 /app/assets/syncdb
/app/assets/syncdb
mv /var/lib/graphite/graphite.db /app/graphite/whisper/graphite.db
chown -R _graphite:_graphite /app/graphite/whisper/graphite.db
echo "create graphite.db"
fi

ln -s /app/graphite/whisper/graphite.db /var/lib/graphite/graphite.db


# i am not sure 'search_index' need to store at host. right now just ignore

chown -R _graphite:_graphite /var/lib/graphite

service carbon-cache start
service apache2 start


bash
