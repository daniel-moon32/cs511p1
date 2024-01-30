####################################################################################
# DO NOT MODIFY THE BELOW ##########################################################

FROM cs511p1-common

# DO NOT MODIFY THE ABOVE ##########################################################
####################################################################################

EXPOSE 9000
EXPOSE 7077
ENV JAVA_HOME=/usr/local/openjdk-8/jre
RUN mkdir /opt/hdfs
RUN mkdir /opt/hdfs/namenode
RUN mkdir /opt/hdfs/datanode

ENV HDFS_NAMENODE_USER=root
ENV HDFS_DATANODE_USER=root
ENV HDFS_SECONDARYNAMENODE_USER=root
ADD ./main/hdfs-site.xml $HADOOP_HOME/etc/hadoop/

# RUN chown -R hdfs:sudo $HADOOP_HOME
COPY ./setup-main.sh ./setup-main.sh
RUN /bin/bash setup-main.sh

COPY ./start-main.sh ./start-main.sh
CMD ["/bin/bash", "start-main.sh"]
