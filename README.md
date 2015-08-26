DOCKER SENSU DASHBOARD GRAPHITE
===========


```

docker build -t tomyhero/sensu-dashboard-graphite .
docker run --name sensu-dashboard-graphite -h sensu-dashboard-graphite -it -d \
	-v /opt/graphite/data:/app/graphite -p 11004:80 -p 2003:2003  \
	-e "ROOT_USER_NAME=root"  -e "ROOT_PASSWORD=root" -e "ROOT_EMAIL=tomohiro.teranishi@gmail.com" \
	tomyhero/sensu-dashboard-graphite bash



```
