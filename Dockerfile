FROM ubuntu:latest

#https://ianunruh.com/2014/05/monitor-everything-part-4.html
RUN apt-get update
RUN apt-get install -y wget vim curl
RUN curl -s http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elasticsearch.org/elasticsearch/1.0/debian stable main" > /etc/apt/sources.list.d/elasticsearch.list
RUN apt-get update
RUN apt-get install -y elasticsearch openjdk-7-jre-headless
RUN apt-get install -y graphite-web graphite-carbon
RUN apt-get install -y apache2 libapache2-mod-wsgi
RUN apt-get install -y graphite-web apache2 apache2-mpm-worker libapache2-mod-wsgi

RUN echo "CARBON_CACHE_ENABLED=true" > /etc/default/graphite-carbon

# Prepare and migrate the SQLite database
RUN chown _graphite /var/lib/graphite
RUN sudo -u _graphite graphite-manage syncdb --noinput

# Configure httpd
RUN rm -f /etc/apache2/sites-enabled/000-default.conf
RUN cp /usr/share/graphite-web/apache2-graphite.conf /etc/apache2/sites-enabled/graphite.conf

# Grafana 
RUN update-rc.d elasticsearch defaults

RUN curl -O -L http://grafanarel.s3.amazonaws.com/grafana-1.5.3.tar.gz
RUN tar xf grafana-1.5.3.tar.gz
RUN cp -R grafana-1.5.3 /usr/share/grafana
RUN echo "alias /grafana /usr/share/grafana" > /etc/apache2/sites-enabled/grafana.conf



RUN apt-get install -y python-txamqp


COPY assets/grafana/config.js /usr/share/grafana/config.js
COPY assets /app/assets

RUN chmod 755 /app/assets/entrypoint.sh
ENTRYPOINT ["/app/assets/entrypoint.sh"]
