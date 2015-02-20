Falcon Demo
-------------------------

Provides scripts for setting up the HDP falcon demo

Usage
-----

The following outlines how to use this project.

* Switch to the hdfs user:
```
su - hdfs (or sudo su - hdfs)
```

* Clone the repo:
```
cd /tmp && git clone https://github.com/sakserv/falcon-demo.git
```

* Populate HDFS with the necessary files and directories
```
cd /tmp/falcon-demo && bash -x bin/falcon_prep.sh
```
