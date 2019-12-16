#!/bin/bash

echo "Updating System"
sudo apt-get update
sudo apt-get -y upgrade

echo "Setting up Elasticsearch"
echo "JAVA_HOME=/usr/lib/jvm/java-11-openjdk-armhf" | sudo tee -a /etc/environment > /dev/null
source /etc/environment
echo "Added Java Home to Env"
pushd .
cd ~/Downloads
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.3.2-no-jdk-amd64.deb
sudo dpkg -i --force-all --ignore-depends=libc6 elasticsearch-7.3.2-no-jdk-amd64.deb
echo "Now we need to augment the status files for APT since this is now misconfigured"

echo "Find and update Status and Depends lines for Package: elasticsearch"
sudo apt-get upgrade
echo "JAVA_HOME=$JAVA_HOME" | sudo tee -a /etc/default/elasticsearch
sudo chmod g+w /etc/elasticsearch

echo "Ensure youre YML is configured.  It will initialize with defaults atm.  You will need to stop and restart to use augmented settings
echo "You need to also make sure that there is no work set, as well as turning off the Machine Learning => xpack.ml.enabled: false"

sudo systemctl enable elasticsearch
sudo systemctl start elasticsearch

echo "Ensure your route for elasticsearch is accessible.  Example:  An external i had connected really only had limited functionality by non-root users, so i 777'd it and all works.  BUT CHECK EVERY DIR ALONG THE PATH"

sudo apt-get install 
