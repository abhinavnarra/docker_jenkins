FROM jenkins:2.46.1-alpine
MAINTAINER Abhinav Narra <abhinav.narraa@gmail.com>
USER root

RUN apk update && apk add wget tar

#USER root
# export DOCKER_HOST environment variable
ARG DOCKER_HOST
ENV DOCKER_HOST=$DOCKER_HOST
# so that jenkins can access docker daemon on docker-machine
# docker reads client certs from this location
#COPY ca.pem cert.pem key.pem /home/docker/.docker/

ENV DOCKER_TLS_VERIFY="1"
ENV DOCKER_CERT_PATH=/var/jenkins_home/.docker
USER root
# Get docker client
RUN wget https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz
RUN tar xvzf docker-latest.tgz && mv ./docker/* /usr/bin/ 