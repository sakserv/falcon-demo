Falcon Demo
-------------------------

Provides scripts for setting up the HDP falcon demo

Usage
-----

The following outlines how to use this project.

* Clone the repo:
```
cd /tmp && git clone https://github.com/sakserv/falcon-demo.git
```

* Populate HDFS with the necessary files and directories
```
su - hdfs -c "cd /tmp/falcon-demo && bash -x bin/falcon_prep.sh"
```

* Submit the entity definitions
```
su - falcon -c "cd /tmp/falcon-demo && bash -x bin/submit_entities.sh"
```
