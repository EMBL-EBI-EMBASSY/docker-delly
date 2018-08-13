FROM centos:7
MAINTAINER Anmol J. Hemrom, anmoljh@gmail.com

RUN yum -y update; yum clean all
RUN yum install -y epel-release; yum clean all
RUN yum install -y wget vim tree git curl; yum clean all

COPY bin/delly_v0.7.8_linux_x86_64bit /usr/local/bin/delly
COPY bin/delly_v0.7.8_parallel_linux_x86_64bit /usr/local/bin/delly_parallel

RUN groupadd -r -g 1000 centos && useradd -r -g centos -u 1000 -m centos
USER centos
WORKDIR /home/centos

CMD ["/bin/bash"]
