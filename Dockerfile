#From <image that you want to use for your container> In this example, we use the Ubuntu image
From ubuntu

RUN apt-get update && apt-get install -y wget

#install docker
RUN wget -qO- https://get.docker.com/ | sh

#install python, pip, setuptools
RUN apt-get install -y python-pip && wget https://bootstrap.pypa.io/ez_setup.py -O -| python
RUN apt-get update && apt-get install -y python-pip 
# RUN apt-get install django
RUN pip install --upgrade pip

#install ice
RUN wget https://static-ice.ng.bluemix.net/icecli-3.0.zip && pip install icecli-3.0.zip

#install cf
RUN wget "https://cli.run.pivotal.io/stable?release=linux64-binary&version=6.11.3&source=github-rel" --output-document=cf.tgz && tar -xvf cf.tgz  && mv cf /usr/bin/cf 
