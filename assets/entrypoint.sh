#!/bin/bash

GRAPHITE_WEB_PORT=${GRAPHITE_WEB_PORT:-80}
GRAFANA_ELASTICSEARCH_PORT=${GRAFANA_ELASTICSEARCH_PORT:-9200}

sed s/{{GRAPHITE_WEB_PORT}}/$GRAPHITE_WEB_PORT/g -i /usr/share/grafana/config.js
sed s/{{GRAFANA_ELASTICSEARCH_PORT}}/$GRAFANA_ELASTICSEARCH_PORT/g -i /usr/share/grafana/config.js



set -e

service carbon-cache start
service apache2 start
service elasticsearch start


bash
