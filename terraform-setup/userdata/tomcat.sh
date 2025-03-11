#/bin/bash

sudo apt update -y

sudo apt install openjdk-17-jdk -y

sudo apt install tomcat10 tomcat10-admin tomcat10-common -y

sudo systemctl start tomcat9

sudo systemctl enable tomcat9