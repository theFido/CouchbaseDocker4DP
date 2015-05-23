FROM centos:centos7
MAINTAINER Fidencio Garrido. fidencio.garrido@gmail.com
RUN yum -y upgrade && yum -y install initscripts openssl wget tar
WORKDIR /home
RUN wget http://packages.couchbase.com/releases/4.0.0-dp/couchbase-server-enterprise-4.0.0-dp-centos7.x86_64.rpm
RUN rpm --install couchbase-server-enterprise-4.0.0-dp-centos7.x86_64.rpm
RUN rm couchbase-server-enterprise-4.0.0-dp-centos7.x86_64.rpm
EXPOSE 8091
EXPOSE 8093
COPY ./cbase.sh /home/cbase.sh
ENTRYPOINT ["sh","/home/cbase.sh"]
