FROM ubuntu:latest

#https://ianunruh.com/2014/05/monitor-everything-part-4.html
RUN apt-get update
RUN apt-get install -y wget vim curl
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

COPY assets /app/assets

# WEB carbon API
EXPOSE 80 2003

# ソース保存先
VOLUME ["/app/whisper"]

RUN chmod 755 /app/assets/entrypoint.sh
ENTRYPOINT ["/app/assets/entrypoint.sh"]
