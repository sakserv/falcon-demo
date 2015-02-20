#!/bin/bash

DL_PATH=/tmp/falcon-demo
RES_PATH=$DL_PATH/resources
HDFS_FALCON_APPS_ROOT=/apps/falcon

# Check that we are running hdfs
if [ $(id -un) != "hdfs" ]; then
  echo "ERROR: Must run as hdfs"
  exit 1
fi

# Copy files into $HDFS_FALCON_APPS_ROOT
echo -e "\n###  Installing falcon workflow dependencies to $HDFS_FALCON_APPS_ROOT"
if hdfs dfs -test -d $HDFS_FALCON_APPS_ROOT; then
  hdfs dfs -rm -r $HDFS_FALCON_APPS_ROOT/oozie
  hdfs dfs -rm -r $HDFS_FALCON_APPS_ROOT/pig
fi
hdfs dfs -mkdir -p $HDFS_FALCON_APPS_ROOT
hdfs dfs -copyFromLocal $RES_PATH/hdfs/apps/falcon/oozie $HDFS_FALCON_APPS_ROOT/
hdfs dfs -copyFromLocal $RES_PATH/hdfs/apps/falcon/pig $HDFS_FALCON_APPS_ROOT/
