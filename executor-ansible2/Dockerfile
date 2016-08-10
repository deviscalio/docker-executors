FROM executor-base

RUN yum install -y ansible \
        python-xmltodict \
        python-pip \
        && pip install pywinrm

RUN yum install -y ansible \
                python-xmltodict \
                python-pip \
                python-devel \
                krb5-devel \
                krb5-libs \
                krb5-workstation \
                gcc
RUN pip install pywinrm \
      && pip install kerberos \
      && pip install requests_kerberos

ADD files/krb5.conf /etc/krb5.conf
