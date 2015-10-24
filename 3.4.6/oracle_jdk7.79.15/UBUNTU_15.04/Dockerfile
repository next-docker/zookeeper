FROM ping2ravi/jdk:oracle_jdk7.79.15_ubuntu.15.04


MAINTAINER Ravi Sharma
# Ubuntu 15.04
# Java Version oracle_jdk7 update 79
# Zookeeper Version 3.4.6
#     http://zookeeper.apache.org/doc/r3.4.6/releasenotes.html
ENV ZOOKEEPER_VERSION 3.4.6
ENV ZOOKEEPER_HOME /opt/zookeeper/zookeeper-${ZOOKEEPER_VERSION}
RUN sudo su; wget http://mirrors.muzzy.org.uk/apache/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz ; gunzip zookeeper-${ZOOKEEPER_VERSION}.tar.gz ; tar -xvf zookeeper-${ZOOKEEPER_VERSION}.tar; mkdir -p ${ZOOKEEPER_HOME}; mv zookeeper-${ZOOKEEPER_VERSION}/* ${ZOOKEEPER_HOME} ; echo ${PATH}; echo ${ZOOKEEPER_HOME}/bin; rm zookeeper-${ZOOKEEPER_VERSION}.tar ; rm -fR zookeeper-${ZOOKEEPER_VERSION}; cp ${ZOOKEEPER_HOME}/conf/zoo_sample.cfg ${ZOOKEEPER_HOME}/conf/zoo.cfg
EXPOSE 2181
ENV PATH ${PATH}:${JAVA_HOME}/bin:${ZOOKEEPER_HOME}/bin:${STORM_HOME}/bin
CMD zkServer.sh start-foreground
