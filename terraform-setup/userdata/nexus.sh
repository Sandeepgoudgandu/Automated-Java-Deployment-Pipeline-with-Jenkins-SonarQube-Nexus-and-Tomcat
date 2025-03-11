#!/bin/bash

sudo apt update -y

wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar -xvf latest-unix.tar.gz
mv nexus-* /opt/nexus
/opt/nexus/bin/nexus start