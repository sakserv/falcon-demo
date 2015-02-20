#!/bin/bash

export PATH=$PATH:/usr/lib/falcon/bin/

if [ $(id -un) != "falcon" ]; then
  echo "ERROR: Must run as user falcon"
  exit 1
fi

# Schedule the cleansed email feed
echo -e "\n###  Scheduling the cleansed email feed"
falcon entity -type feed -schedule -name cleansedEmailFeed

# Schedule the cleansed email process
echo -e "\n###  Scheduling the cleansed email process"
falcon entity -type process -schedule -name cleanseEmailProcess