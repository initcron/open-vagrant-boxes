#!/bin/bash

DEBIAN_FRONTEND=noninteractive apt-get -y install python-software-properties
add-apt-repository ppa:webupd8team/java
DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y upgrade

# automatically accept oracle license
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# and install java 7 oracle jdk
DEBIAN_FRONTEND=noninteractive apt-get -y install oracle-java7-installer
update-alternatives --display java
# set the java environment variables for when you "bash -l"
DEBIAN_FRONTEND=noninteractive apt-get -y install oracle-java7-set-default && apt-get clean

exit 0
