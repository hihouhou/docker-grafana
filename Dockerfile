#
# Grafana server Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV GRAFANA_VERSION 7.5.9
WORKDIR /etc/grafana/ 

# Update & install packages for grafana
RUN apt-get update && \
    apt-get install -y wget dpkg-dev adduser libfontconfig
RUN wget --no-check-certificate https://dl.grafana.com/oss/release/grafana_${GRAFANA_VERSION}_amd64.deb && \
    dpkg -i grafana_${GRAFANA_VERSION}_amd64.deb

#Configure grafana
ADD defaults.ini /etc/grafana/conf/
RUN ln -s /usr/share/grafana/public /etc/grafana/public
EXPOSE 3000

#/usr/sbin/grafana-server
CMD ["grafana-server"]
