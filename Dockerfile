FROM centos:7
ENV container docker

RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

ADD CentOS7-Base-163.repo /etc/yum.repos.d/CentOS7-Base-163.repo

RUN yum clean all && yum makecache

RUN yum install -y gcc make ruby.x86_64 ruby-devel.x86_64 redis-server

RUN gem sources --add http://gems.ruby-china.org/ --remove https://rubygems.org/

RUN gem update --system

RUN gem install --no-rdoc --no-ri json -v 2.1.0

RUN gem install --no-rdoc --no-ri sinatra -v 1.4.8

RUN gem install --no-rdoc --no-ri redis

RUN mkdir -p /opt/webapp

EXPOSE 4567

CMD ["/opt/webapp/bin/webapp"]

