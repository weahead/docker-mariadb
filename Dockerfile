FROM mariadb:10.1.14

MAINTAINER We ahead <docker@weahead.se>

ENV DATA_DIR=/var/lib/mysql \
    TARGET_USER=mysql

# See https://github.com/docker-library/mariadb/issues/58#issuecomment-231191861
RUN sed -i 's/^innodb_flush_method/#innodb_flush_method/' /etc/mysql/my.cnf

ADD https://github.com/weahead/docker-data-overlay/releases/download/v2.0.0/wrap-docker-entrypoint.sh /wrap-docker-entrypoint.sh

RUN chmod +x /wrap-docker-entrypoint.sh

ENTRYPOINT ["/wrap-docker-entrypoint.sh", "docker-entrypoint.sh"]

CMD ["mysqld"]
