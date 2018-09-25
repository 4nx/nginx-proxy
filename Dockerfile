FROM nginx:stable-alpine

LABEL maintainer="Simon Krenz <sk@4nx.io>" 

RUN apk add --no-cache nginx-mod-mail openssl

COPY config /config
COPY ./docker-entrypoint.sh /

EXPOSE 25/tcp 80/tcp 443/tcp 465/tcp 587/tcp 993/tcp 10025/tcp 10143/tcp

VOLUME ["/etc/nginx", "/etc/ssl", "/var/log/nginx"]

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/sh"]
