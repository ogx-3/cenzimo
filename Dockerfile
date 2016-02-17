#From <image that you want to use for your container> In this example, we use the Ubuntu image
# FROM ubuntu:14.04
FROM python:3.4

MAINTAINER cenzimo beiwei "3ogx.com@gmail.com"

#install docker
RUN wget -qO- https://get.docker.com/ | sh
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y

RUN apt-get install -y apt-utils
# Libs required for geospatial libraries on Debian...
RUN apt-get -y install binutils libproj-dev gdal-bin

RUN apt-get install -y nano wget
# build dependencies for postgres and image bindings
RUN apt-get install -y python-imaging python-psycopg2

##############################################################################
# setup startup script for gunicord WSGI service 
##############################################################################

RUN groupadd webapps
RUN useradd webapp -G webapps
RUN mkdir -p /var/log/webapp/ && chown -R webapp /var/log/webapp/ && chmod -R u+rX /var/log/webapp/
RUN mkdir -p /var/run/webapp/ && chown -R webapp /var/run/webapp/ && chmod -R u+rX /var/run/webapp/

##############################################################################
# Install and configure supervisord
##############################################################################

RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD ./deploy/supervisor_conf.d/webapp.conf /etc/supervisor/conf.d/webapp.conf

ADD . /var/app/cenzimo
WORKDIR /var/app/cenzimo
# Add and install Python modules
RUN pip install -r requirements.txt

CMD ["sh", "./deploy/container_start.sh"]
EXPOSE 8002

