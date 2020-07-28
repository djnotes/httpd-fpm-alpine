FROM httpd:2.4-alpine

RUN apk update \
&& apk add php php-fpm supervisor


COPY httpd.conf /usr/local/apache2/conf/
COPY supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY supervisor/conf.d/ /etc/supervisor/conf.d/


COPY . /usr/local/apache2/htdocs




# RUN sed -i  "s@listen = 127.0.0.1:9000@listen = /var/run/php-fpm.sock@g"  /etc/php7/php-fpm.d/www.conf


CMD ["supervisord","-n", "-c", "/etc/supervisor/supervisord.conf"]

