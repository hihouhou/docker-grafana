#
# Grafana server Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV GRAFANA_VERSION grafana_2.1.2
WORKDIR /etc/grafana/ 

# Update & install packages for graylog
RUN apt-get update && \
    apt-get install -y wget dpkg-dev adduser libfontconfig
RUN wget --no-check-certificate https://grafanarel.s3.amazonaws.com/builds/${GRAFANA_VERSION}_amd64.deb && \
    dpkg -i ${GRAFANA_VERSION}_amd64.deb

#Configure grafana
ADD defaults.ini /etc/grafana/conf/
RUN ln -s /usr/share/grafana/public /etc/grafana/public
EXPOSE 3000

#/usr/sbin/grafana-server
CMD ["grafana-server"]
