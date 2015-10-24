PARAM_UBUNTU_VERSION=$1
PARAM_JDK_VERSION=$2
PARAM_ZOOKEEPER_VERSION=$3

OIFS=$IFS
IFS='.' read -ra JDK_VERSION_ARRAY <<< "$PARAM_JDK_VERSION"

echo "FROM ping2ravi/jdk:${PARAM_JDK_VERSION}_ubuntu.${PARAM_UBUNTU_VERSION}"
echo ""
echo ""

echo "MAINTAINER Ravi Sharma"


echo "# Ubuntu ${PARAM_UBUNTU_VERSION}"
echo "# Java Version ${JDK_VERSION_ARRAY[0]} update ${JDK_VERSION_ARRAY[1]}"
echo "# Zookeeper Version ${PARAM_ZOOKEEPER_VERSION}" 
echo "#     http://zookeeper.apache.org/doc/r${PARAM_ZOOKEEPER_VERSION}/releasenotes.html"


echo "ENV ZOOKEEPER_VERSION $PARAM_ZOOKEEPER_VERSION"

echo "ENV ZOOKEEPER_HOME /opt/zookeeper/zookeeper-\${ZOOKEEPER_VERSION}"


echo "RUN sudo su; wget http://mirrors.muzzy.org.uk/apache/zookeeper/zookeeper-\${ZOOKEEPER_VERSION}/zookeeper-\${ZOOKEEPER_VERSION}.tar.gz ; gunzip zookeeper-\${ZOOKEEPER_VERSION}.tar.gz ; tar -xvf zookeeper-\${ZOOKEEPER_VERSION}.tar; mkdir -p \${ZOOKEEPER_HOME}; mv zookeeper-\${ZOOKEEPER_VERSION}/* \${ZOOKEEPER_HOME} ; echo \${PATH}; echo \${ZOOKEEPER_HOME}/bin; rm zookeeper-\${ZOOKEEPER_VERSION}.tar ; rm -fR zookeeper-\${ZOOKEEPER_VERSION}; cp \${ZOOKEEPER_HOME}/conf/zoo_sample.cfg \${ZOOKEEPER_HOME}/conf/zoo.cfg"


echo "EXPOSE 2181"


echo "ENV PATH \${PATH}:\${JAVA_HOME}/bin:\${ZOOKEEPER_HOME}/bin:\${STORM_HOME}/bin"


echo "CMD zkServer.sh start-foreground"

IFS=$OIFS
