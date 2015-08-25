DOCKER SENSU DASHBOARD GRAPHITE
===========


```

docker build -t tomyhero/sensu-dashboard-graphite .
docker run --name sensu-dashboard-graphite -h sensu-dashboard-graphite -it -d -v /opt/graphite/data:/app/whisper -p 11004:80 -p 2003:2003 tomyhero/sensu-dashboard-graphite bash


```

