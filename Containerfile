FROM centos:6
ENV container=docker

RUN rpm --import https://www.centos.org/keys/RPM-GPG-KEY-CentOS-6 file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6 \
    && yum makecache fast \
    && yum --disableplugin=fastestmirror -y install epel-release \
    && yum --disableplugin=fastestmirror -y --enablerepo=epel-testing install \
    bash \
    cronie \
    initscripts \
    ndg-httpsclient \
    pyasn1 \
    python \
    python-pip \
    python-jinja2 \
    python-urllib3 \
    pyOpenSSL \
    python-setuptools \
    sudo \
    urllib3 \
    yum-plugin-ovl \
    && yum -y update \
    && rm -rf /var/cache/yum \
    && rm -rf /usr/share/backgrounds/*.{png,jpg}

RUN pip install --upgrade pycrypto 'cryptography<2.0.0' 'pycparser<2.19'

RUN pip install ansible q

RUN sed -i 's/Defaults    requiretty/Defaults    !requiretty/g' /etc/sudoers

CMD ["/sbin/init"]
