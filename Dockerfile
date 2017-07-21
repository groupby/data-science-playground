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
RUN service ssh start
