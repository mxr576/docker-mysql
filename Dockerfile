FROM simpledrupalcloud/base

MAINTAINER Simple Drupal Cloud <support@simpledrupalcloud.com>

ENV DEBIAN_FRONTEND noninteractive

ADD ./src /src

RUN chmod +x /src/build.sh
RUN /src/build.sh

RUN rm -rf /tmp/*

VOLUME ["/mysql-5.5.38/conf.d"]
VOLUME ["/mysql-5.5.38/data"]
VOLUME ["/mysql-5.5.38/log"]

EXPOSE 3306

ENTRYPOINT ["/src/run.sh"]
