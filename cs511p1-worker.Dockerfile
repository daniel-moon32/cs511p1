####################################################################################
# DO NOT MODIFY THE BELOW ##########################################################

FROM cs511p1-common

# DO NOT MODIFY THE ABOVE ##########################################################
####################################################################################

RUN mkdir /opt/hdfs
RUN mkdir /opt/hdfs/datanode
ENV HDFS_NAMENODE_USER=root
ADD ./workers/hdfs-site.xml $HADOOP_HOME/etc/hadoop/

COPY ./setup-worker.sh ./setup-worker.sh
RUN /bin/bash setup-worker.sh

COPY ./start-worker.sh ./start-worker.sh
CMD ["/bin/bash", "start-worker.sh"]
