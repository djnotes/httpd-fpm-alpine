FROM httpd:2.4-alpine

RUN apk update \
&& apk add php php-fpm supervisor


COPY httpd.conf /usr/local/apache2/conf/
COPY supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY supervisor/conf.d/ /etc/supervisor/conf.d/


COPY . /usr/local/apache2/htdocs



CMD ["supervisord","-n", "-c", "/etc/supervisor/supervisord.conf"]

