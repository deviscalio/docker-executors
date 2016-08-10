FROM centos:7.2.1511

RUN yum -y update && yum -y install openssh-server \
	git \
	epel-release \
	wget \
	bzip2 \
	java-1.7.0-openjdk \
	&& yum -y install supervisor

RUN mkdir -p /var/run/sshd \
	&& /usr/bin/ssh-keygen -A \
	&& sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd \
	&& sed -i 's|#PubkeyAuthentication yes|PubkeyAuthentication yes|g' /etc/ssh/sshd_config \
	&& sed -i 's|#RSAAuthentication yes|RSAAuthentication yes|g' /etc/ssh/sshd_config \
	&& sed -i 's|PasswordAuthentication yes|PasswordAuthentication no|g' /etc/ssh/sshd_config

RUN mkdir -p /var/run/supervisord
COPY files/supervisord.conf /etc/supervisord.conf

COPY files/authorized_keys /home/jenkins/.ssh/authorized_keys
RUN groupadd -g <Jenkins Group GID> jenkins \
	&& useradd -u <Jenkins User UID> -g <Jenkins Group GID> jenkins \
	&& chown -R jenkins:jenkins /home/jenkins \
	&& chmod 700 /home/jenkins/.ssh \
	&& chmod 600 /home/jenkins/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/bin/supervisord"]
