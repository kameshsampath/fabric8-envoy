FROM centos

MAINTAINER Kamesh Sampath <kamesh.sampath@hotmail.com>

LABEL envoy.version=1.2.0

USER root

RUN mkdir -p /etc/envoy && \
    yum -y update && \
    yum -y install c-ares && \
    yum -y clean all 

VOLUME /etc/envoy
VOLUME /var/log/envoy

ADD bin/envoy /usr/local/bin/

CMD ["envoy","-c","/etc/envoy/config.json"]
