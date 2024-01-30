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

echo "export JAVA_HOME=/usr/local/openjdk-8/jre" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh
# groupadd hadoop
# adduser --ingroup hadoop hdfs
# chown -R hdfs:hadoop $HADOOP_HOME
/usr/local/hadoop/bin/hdfs namenode -format