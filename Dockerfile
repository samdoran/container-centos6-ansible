FROM centos:6
RUN rpm --import https://getfedora.org/static/0608B895.txt file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6 \
    && yum --disableplugin=fastestmirror -y install epel-release \
    && yum --disableplugin=fastestmirror -y --enablerepo=epel-testing install ansible pynton-jinja2 initscripts sudo cronie \
    && yum -y update \
    && yum clean all

RUN sed -i 's/Defaults    requiretty/Defaults    !requiretty/g' /etc/sudoers

# Install Ansible inventory file.
RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

VOLUME ["/sys/fs/cgroup"]
CMD ["/sbin/init"]
