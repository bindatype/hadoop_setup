#!/bin/sh

if [ -f hadoop-2.7.3.tar.gz ] 
	then
		 rm hadoop-2.7.3.tar.gz 
fi 

wget http://apache.cs.utah.edu/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz
tar zxvf hadoop-2.7.3.tar.gz
mv hadoop-2.7.3 /usr/local/hadoop
chown -R hduser:hadoop /usr/local/hadoop
mkdir -p /usr/local/hadoop_store/hdfs/namenode
mkdir -p /usr/local/hadoop_store/hdfs/datanode
chown -R hduser:hadoop /usr/local/hadoop_store
mkdir -p /app/hadoop/tmp
chown hduser:hadoop /app/hadoop/tmp/


apt-get -y install vim
add-apt-repository -y ppa:webupd8team/java
apt-get update && sudo apt-get -y install oracle-jdk7-installer
apt-get -y install openssh-server
addgroup hadoop
adduser --ingroup hadoop hduser
adduser hduser sudo
runuser -l hduser -c 'mkdir -p $HOME/.ssh && touch $HOME/.ssh/authorized_keys&&cd $HOME/.ssh&&ssh-keygen -f id_rsa -t rsa -P "" && cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys && chmod 400 $HOME/.ssh/authorized_keys'
runuser -l hduser -c 'ssh -o "StrictHostKeyChecking no"  localhost && exit'
##runuser -l hduser -c 'wget http://apache.cs.utah.edu/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz'
##runuser -l hduser -c 'tar zxvf hadoop-2.7.3.tar.gz'
##runuser -l hduser -c 'sudo mv hadoop-2.7.3 /usr/local/hadoop'
##runuser -l hduser -c 'sudo chown -R hduser:hadoop /usr/local/hadoop'

chown -R hduser:hadoop /usr/local/hadoop
