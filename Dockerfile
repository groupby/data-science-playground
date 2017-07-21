FROM ubuntu:16.04

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre
ENV HADOOP_HOME /opt/hadoop-2.8.1
ENV HADOOP_LOG_DIR /opt/hadoop-2.8.1/logs

RUN apt-get update && apt-get install -y ssh pdsh openjdk-8-jdk curl
WORKDIR /opt
RUN curl -o hadoop-2.8.1.tar.gz http://apache.mirror.vexxhost.com/hadoop/common/hadoop-2.8.1/hadoop-2.8.1.tar.gz
RUN tar -xzvf hadoop-2.8.1.tar.gz
RUN mkdir /opt/hadoop-2.8.1/logs
COPY hadoop-env.sh /opt/hadoop-2.8.1/etc/hadoop/hadoop-env.sh
COPY core-site.xml /opt/hadoop-2.8.1/etc/hadoop/core-site.xml
COPY hdfs-site.xml /opt/hadoop-2.8.1/etc/hadoop/hdfs-site.xml
RUN service ssh start
# COPY ssh key for root user and authorized_keys file???
# RUN format the hdfs filesystem???
# RUN start the namenode and datanode daemons???
# RUN create the HDFS directories necessary for map reduce jobs???
# COPY etc/hadoop/mapred-site.xml to container???
# COPY etc/hadoop/yarn-site.xml to container???
# EXPOSE the HDFS namenode and yarn resourcemanager web interface ports???
