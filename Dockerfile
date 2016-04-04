FROM alpine:edge
MAINTAINER George Kutsurua <g.kutsurua@gmail.com>

RUN apk update &&\
    apk add postgresql postgresql-contrib curl &&\
    curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.4/gosu-amd64" &&\
	chmod +x /usr/local/bin/gosu &&\
	mkdir /docker-entrypoint-initdb.d &&\
	mkdir -p /var/run/postgresql &&\
	chown -R postgres /var/run/postgresql &&\
	rm -rf /var/cache/apk/*

ENV LANG=en_US.utf8 PGDATA=/var/lib/postgresql/data

VOLUME ["/var/lib/postgresql/data"]

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["postgres"]

EXPOSE 5432