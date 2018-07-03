FROM centos:7
MAINTAINER Anmol J. Hemrom, anmoljh@gmail.com

RUN yum -y update; yum clean all
RUN yum install -y epel-release; yum clean all
