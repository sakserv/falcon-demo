#!/bin/bash
curl -sS http://bailando.sims.berkeley.edu/enron/enron_with_categories.tar.gz | tar xz && hadoop fs -mkdir -p $1 && hadoop fs -put enron_with_categories/*/*.txt $1