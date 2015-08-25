#!/bin/bash

set -e

chown -R _graphite:_graphite /app/whisper
rmdir /var/lib/graphite/whisper
ln -s /app/whisper /var/lib/graphite/whisper 
chown -R _graphite:_graphite /var/lib/graphite/whisper

service carbon-cache start
service apache2 start


bash
