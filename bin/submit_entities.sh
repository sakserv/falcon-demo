#!/bin/bash

export PATH=$PATH:/usr/lib/falcon/bin/
DL_PATH=/tmp/falcon-demo
RES_PATH=$DL_PATH/resources

if [ $(id -un) != "falcon" ]; then
  echo "ERROR: Must run as user falcon"
  exit 1
fi

# Submit the cluster entities
echo -e "\n###  Submiting the cluster entities"
falcon entity -type cluster -submit -file $RES_PATH/falcon/cluster-prodCluster.xml
falcon entity -type cluster -submit -file $RES_PATH/falcon/cluster-drCluster.xml

# Submit the feed entities
echo -e "\n###  Submiting the feed entities"
falcon entity -type feed -submit -file $RES_PATH/falcon/feed-rawEmailFeed.xml
falcon entity -type feed -submit -file $RES_PATH/falcon/feed-cleansedEmailFeed.xml

# Submit the process entities
echo -e "\n###  Submiting the process entities"
falcon entity -type process -submit -file $RES_PATH/falcon/process-emailIngestProcess.xml
falcon entity -type process -submit -file $RES_PATH/falcon/process-cleanseEmailProcess.xml