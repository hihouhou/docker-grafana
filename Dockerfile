#
# Grafana server Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV GRAFANA_VERSION grafana_2.1.2

# Update & install packages for graylog
RUN apt-get update && \
    apt-get install -y wget dpkg-dev adduser libfontconfig
RUN wget --no-check-certificate https://grafanarel.s3.amazonaws.com/builds/${GRAFANA_VERSION}_amd64.deb && \
    dpkg -i ${GRAFANA_VERSION}_amd64.deb

#Configure grafana
ADD grafana.ini /etc/grafana/grafana.ini

#Add link for binary
#RUN ln -s /$SERVER_VERSION/bin/graylogctl /usr/bin/graylogctl && ls -l /usr/bin/graylogctl

EXPOSE 3000

#/usr/sbin/grafana-server
CMD ["grafana-server", "-config=/etc/grafana/grafana.ini"]
