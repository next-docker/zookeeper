UBUNTU_VERSIONS=(14.04 15.04 15.10)
JDK_VERSIONS=(oracle_jdk7.79.15 oracle_jdk7.80.15 oracle_jdk8.60.27 oracle_jdk8.65.17 oracle_jdk8.66.17)
ZOOKEEPER_VERSIONS=(3.4.6 3.4.5)


echo ${UBUNTU_VERSIONS[@]}
for UBUNTU_VERSION in "${UBUNTU_VERSIONS[@]}"
   do
   for JDK_VERSION in "${JDK_VERSIONS[@]}"
      do
      for ZK_VERSION in "${ZOOKEEPER_VERSIONS[@]}"
         do
         echo "$ZK_VERSION/$JDK_VERSION/UBUNTU_$UBUNTU_VERSION" 
         mkdir -p $ZK_VERSION/$JDK_VERSION/UBUNTU_$UBUNTU_VERSION
         ./Dockerfile.sh $UBUNTU_VERSION $JDK_VERSION $ZK_VERSION > $ZK_VERSION/$JDK_VERSION/UBUNTU_$UBUNTU_VERSION/Dockerfile
         done
      done 
   done



