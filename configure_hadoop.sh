#!/bin/sh

echo '#HADOOP ENVIRONMENT VARIABLES START
export JAVA_HOME=/usr/lib/jvm/java-7-oracle
export HADOOP_INSTALL=/usr/local/hadoop
export PATH=$PATH:$HADOOP_INSTALL/bin
export PATH=$PATH:$HADOOP_INSTALL/sbin
export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_HOME=$HADOOP_INSTALL
export HADOOP_HDFS_HOME=$HADOOP_INSTALL
export YARN_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_INSTALL/lib"
export HADOOP_CONF=/usr/local/hadoop/conf
export HADOOP_PREFIX=/usr/local/hadoop
export PATH=$PATH:$HADOOP_PREFIX/bin
#HADOOP ENVIRONMENT VARIABLES END' >> $HOME/.bashrc

sed -i 's/${JAVA_HOME}/\/usr\/lib\/jvm\/java-7-oracle/g' /usr/local/hadoop/etc/hadoop/hadoop-env.sh

sed -i 's/<configuration>//g' /usr/local/hadoop/etc/hadoop/core-site.xml
sed -i 's/<\/configuration>//g' /usr/local/hadoop/etc/hadoop/core-site.xml


echo "<configuration>
 <property>
  <name>hadoop.tmp.dir</name>
  <value>/app/hadoop/tmp</value>
  <description>A base for other temporary directories.</description>
 </property>

 <property>
  <name>fs.default.name</name>
  <value>hdfs://localhost:54310</value>
  <description>The name of the default file system.  A URI whose
  scheme and authority determine the FileSystem implementation.  The
  uri's scheme determines the config property (fs.SCHEME.impl) naming
  the FileSystem implementation class.  The uri's authority is used to
  determine the host, port, etc. for a filesystem.</description>
 </property>
</configuration>" >> /usr/local/hadoop/etc/hadoop/core-site.xml

cp /usr/local/hadoop/etc/hadoop/mapred-site.xml.template /usr/local/hadoop/etc/hadoop/mapred-site.xml

sed -i 's/<configuration>//g'  /usr/local/hadoop/etc/hadoop/mapred-site.xml
sed -i 's/<\/configuration>//g' /usr/local/hadoop/etc/hadoop/mapred-site.xml

echo "<configuration>
 <property>
  <name>mapred.job.tracker</name>
  <value>localhost:54311</value>
  <description>The host and port that the MapReduce job tracker runs
  at.  If "local", then jobs are run in-process as a single map
  and reduce task.
  </description>
 </property>
</configuration>
" >> /usr/local/hadoop/etc/hadoop/mapred-site.xml



sed -i 's/<configuration>//g' /usr/local/hadoop/etc/hadoop/hdfs-site.xml
sed -i 's/<\/configuration>//g' /usr/local/hadoop/etc/hadoop/hdfs-site.xml

echo "<configuration>
 <property>
  <name>dfs.replication</name>
  <value>1</value>
  <description>Default block replication.
  The actual number of replications can be specified when the file is created.
  The default is used if replication is not specified in create time.
  </description>
 </property>
 <property>
   <name>dfs.namenode.name.dir</name>
   <value>file:/usr/local/hadoop_store/hdfs/namenode</value>
 </property>
 <property>
   <name>dfs.datanode.data.dir</name>
   <value>file:/usr/local/hadoop_store/hdfs/datanode</value>
 </property>
</configuration>
" >> /usr/local/hadoop/etc/hadoop/hdfs-site.xml

