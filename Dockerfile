FROM centos:centos6 #going to use centos repo to build docker image

MAINTAINER santoshpsd13@gmail.com

# Enable EPEL for Node.js
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Install Node...
RUN yum install -y npm

# Copy app to /src
COPY . /src

# Install app and dependencies into /src; when we do npm install it reads package.json and install dependecies.
RUN cd /src; npm install

EXPOSE 8080

CMD cd /src && node ./app.js