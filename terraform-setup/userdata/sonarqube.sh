#!/bin/bash

sudo apt update -y

sudo apt install docker.io -y

sudo docker run -itd --name sonarqube -p 9000:9000 sonarqube:lts