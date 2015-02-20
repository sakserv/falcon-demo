#!/bin/bash

export PATH=$PATH:/usr/lib/falcon/bin/

if [ $(id -un) != "falcon" ]; then
  echo "ERROR: Must run as user falcon"
  exit 1
fi

# Schedule the raw email feed
echo -e "\n###  Scheduling the raw email feed"
falcon entity -type feed -schedule -name rawEmailFeed

# Schedule the raw email process
echo -e "\n###  Scheduling the raw email process"
falcon entity -type process -schedule -name rawEmailIngestProcess