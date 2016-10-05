FROM alpine:edge
MAINTAINER George Kutsurua <g.kutsurua@gmail.com>

RUN apk add --no-cache postgresql postgresql-dev postgresql-client postgresql-contrib \
    postgresql-libs sudo

ENV LANG=en_US.utf8 PGDATA=/var/lib/postgresql/data

VOLUME ["/var/lib/postgresql/data"]

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["postgres"]

EXPOSE 5432