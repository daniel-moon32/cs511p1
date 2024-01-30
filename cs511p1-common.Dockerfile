####################################################################################
# DO NOT MODIFY THE BELOW ##########################################################

FROM openjdk:8

RUN apt update && \
    apt upgrade --yes && \
    apt install ssh openssh-server --yes

# Setup common SSH key.
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/shared_rsa -C common && \
    cat ~/.ssh/shared_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys

# DO NOT MODIFY THE ABOVE ##########################################################
####################################################################################

# Setup HDFS/Spark resources here
ARG HADOOP_VERSION=3.3.6
ARG SPARK_VERSION=3.4.2
ENV HADOOP_HOME=/usr/local/hadoop
ENV SPARK_HOME=/usr/local/spark
ENV JAVA_HOME=/usr/local/openjdk-8/jre
ENV PATH=$PATH:$HADOOP_HOME/bin
ENV PATH=$PATH:$SPARK_HOME/bin

RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz  && \
    tar -xzf hadoop-3.3.6.tar.gz && \
    mv hadoop-3.3.6 /usr/local/hadoop && \
    rm hadoop-3.3.6.tar.gz

RUN wget https://dlcdn.apache.org/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop3.tgz  && \
 tar -xvzf spark-3.4.2-bin-hadoop3.tgz && \
 mv spark-3.4.2-bin-hadoop3 /usr/local/spark && \
 rm spark-3.4.2-bin-hadoop3.tgz

RUN apt-get install scala -y

ADD core-site.xml /usr/local/hadoop/etc/hadoop/