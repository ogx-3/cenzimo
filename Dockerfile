#From <image that you want to use for your container> In this example, we use the Ubuntu image
FROM ubuntu:14.04

MAINTAINER cenzimo "3ogx.com@gmail.com"

RUN apt-get update && apt-get install -y wget

#install docker
RUN wget -qO- https://get.docker.com/ | sh

# Install Python Setuptools
RUN apt-get install -y python-setuptools

#install python, pip, setuptools
# RUN easy_install pip
RUN apt-get install -y python-pip && wget https://bootstrap.pypa.io/ez_setup.py -O -| python
RUN apt-get update && apt-get install -y python-pip 

#install ice
# RUN wget https://static-ice.ng.bluemix.net/icecli-3.0.zip && pip install icecli-3.0.zip

#install cf
# RUN wget "https://cli.run.pivotal.io/stable?release=linux64-binary&version=6.11.3&source=github-rel" --output-document=cf.tgz && tar -xvf cf.tgz  && mv cf /usr/bin/cf 

# Add and install Python modules
RUN pip install -r requirements.txt

EXPOSE 5000

ADD ./ /var/app/cenzimo/
WORKDIR /var/app/cenzimo/
ENTRYPOINT ["python" "/var/app/cenzimo/manage.py runserver"]
# CMD ["python", "manage.py runserver"]
