# Mongo with custom userid

FROM registry.vtg/vertigo/docker-base:latest

MAINTAINER Rubens Neto

WORKDIR /opt

ADD src/mongodb-org-3.0.repo /etc/yum.repos.d/mongodb-org-3.0.repo

RUN yum install -y mongodb-org && \
    yum clean all

VOLUME /data/db
ADD src/entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]

EXPOSE 27017
CMD ["mongod"]
