#!/bin/bash
export JAVA_HOME=/usr/local/openjdk-8/jre

####################################################################################
# DO NOT MODIFY THE BELOW ##########################################################

ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

# DO NOT MODIFY THE ABOVE ##########################################################
####################################################################################

# Setup HDFS/Spark main here
touch $SPARK_HOME/conf/spark-env.sh
echo "SPARK_MASTER_HOST=main" >> $SPARK_HOME/conf/spark-env.sh
echo "export JAVA_HOME=/usr/local/openjdk-8/jre" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh
/usr/local/hadoop/bin/hdfs namenode -format