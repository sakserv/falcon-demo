#!/bin/bash

DL_PATH=/tmp/falcon-demo
RES_PATH=$DL_PATH/resources
HDFS_FALCON_APPS_ROOT=/apps/falcon

PROD_HDFS_ROOT=/data/prodCluster
DR_HDFS_ROOT=/data/drCluster

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

# Setup the production cluster HDFS location
echo -e "\n### Creating $PROD_HDFS_ROOT for production workflows"
if hdfs dfs -test -d $PROD_HDFS_ROOT; then
  hdfs dfs -rm -r $PROD_HDFS_ROOT
fi
hdfs dfs -mkdir -p $PROD_HDFS_ROOT

# Staging Dir
hdfs dfs -mkdir -p $PROD_HDFS_ROOT/staging
hdfs dfs -chmod -R 777 $PROD_HDFS_ROOT/staging

# Working dir
hdfs dfs -mkdir -p $PROD_HDFS_ROOT/working
hdfs dfs -chmod -R 755 $PROD_HDFS_ROOT/working

# Change ownership of $PROD_HDFS_ROOT
hdfs dfs -chown -R falcon:hadoop $PROD_HDFS_ROOT

# Setup the dr cluster HDFS location
echo -e "\n### Creating $DR_HDFS_ROOT for DR workflows"
if hdfs dfs -test -d $DR_HDFS_ROOT; then
  hdfs dfs -rm -r $DR_HDFS_ROOT
fi
hdfs dfs -mkdir -p $DR_HDFS_ROOT

# Staging Dir
hdfs dfs -mkdir -p $DR_HDFS_ROOT/staging
hdfs dfs -chmod -R 777 $DR_HDFS_ROOT/staging

# Working dir
hdfs dfs -mkdir -p $DR_HDFS_ROOT/working
hdfs dfs -chmod -R 755 $DR_HDFS_ROOT/working

# Change ownership of $DR_HDFS_ROOT
hdfs dfs -chown -R falcon:hadoop $DR_HDFS_ROOT