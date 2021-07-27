FROM centos:6
ENV container=docker

COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

RUN rpm --import https://www.centos.org/keys/RPM-GPG-KEY-CentOS-6 file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6 \
    && yum makecache fast \
    && yum --disableplugin=fastestmirror -y install epel-release \
    && yum --disableplugin=fastestmirror -y --enablerepo=epel-testing install \
    bash \
    cronie \
    gcc \
    initscripts \
    libffi \
    libffi-devel \
    make \
    ndg-httpsclient \
    pyasn1 \
    pyOpenSSL \
    python \
    python-devel \
    python-jinja2 \
    python-pip \
    python-setuptools \
    python-urllib3 \
    sudo \
    urllib3 \
    yum-plugin-ovl \
    && yum -y update \
    && rm -rf /var/cache/yum \
    && rm -rf /usr/share/backgrounds/*.{png,jpg}

CMD ["/sbin/init"]
