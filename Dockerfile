FROM haproxy:2.0.5-alpine
RUN apk update && apk add --no-cache openrc htop
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64
RUN chmod +x /usr/local/bin/dumb-init
COPY start.sh /start.sh
RUN  chmod +x /start.sh
COPY haproxy /etc/init.d/haproxy
COPY dataplaneapi /usr/local/sbin/dataplaneapi
RUN chmod +x /usr/local/sbin/dataplaneapi
RUN  chmod +x /etc/init.d/haproxy
ENTRYPOINT [ "/usr/local/bin/dumb-init","--","/start.sh" ]