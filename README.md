DOCKER SENSU DASHBOARD GRAPHANA
===========


```

docker build -t tomyhero/sensu-dashboard-graphana .
docker run --name sensu-dashboard-graphana -it -d -p 10200:80 -p 2003:2003  tomyhero/sensu-dashboard-graphana bash


```


