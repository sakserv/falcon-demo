#!/bin/bash

DL_PATH=/tmp/falcon-demo
RES_PATH=$DL_PATH/resources
HDFS_FALCON_APPS_ROOT=/apps/falcon

# Copy files into $HDFS_FALCON_APPS_ROOT
echo -e "\n###  Installing falcon workflow dependencies to $HDFS_FALCON_APPS_ROOT"
if [ ! hdfs dfs -test $HDFS_FALCON_APPS_ROOT ]; then
  hdfs dfs -mkdir -p $HDFS_FALCON_APPS_ROOT
fi
hdfs dfs -copyFromLocal $RES_PATH/hdfs/apps/falcon/* $HDFS_FALCON_APPS_ROOT/
