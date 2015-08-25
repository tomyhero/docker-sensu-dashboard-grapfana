DOCKER SENSU DASHBOARD GRAFANA
===========


```

docker build -t tomyhero/sensu-dashboard-graphana .
docker run --name sensu-dashboard-graphana -it -d -p 11004:80 -p 2003:2003  -p 11005:9200 -e GRAFANA_ELASTICSEARCH_PORT=11005 tomyhero/sensu-dashboard-graphana bash


```
