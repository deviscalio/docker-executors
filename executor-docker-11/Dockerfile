FROM executor-base

COPY files/docker.repo /etc/yum.repos.d/docker.repo

RUN yum install -y docker-engine-1.11.1 \
	&& curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
	&& chmod +x /usr/local/bin/docker-compose \
	&& mkdir /etc/ssl/docker

USER jenkins
RUN mkdir /home/jenkins/.docker

USER root
