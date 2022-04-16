#!/usr/bin/env bash

#java installation
sudo apt update -y 
sudo apt install openjdk-8-jdk -y
sudo echo 'JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64 && export JAVA_HOME && PATH=$PATH:$JAVA_HOME/bin && export PATH' >> .bashrc
. .bashrc
. /etc/environment

#maven installation
cd /opt
sudo mkdir maven
cd maven
sudo wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
sudo tar xvfz apache-maven-3.6.3-bin.tar.gz
cd /etc/profile.d/
sudo touch maven.sh
sudo chmod 755 maven.sh
sudo chown -R ubuntu:ubuntu maven.sh
sudo echo 'export M2_HOME=/opt/maven/apache-maven-3.6.3 && export PATH=${M2_HOME}/bin:${PATH}' >> maven.sh
. maven.sh

#jenkins installation
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y
sudo apt install jenkins -y 
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo ufw allow 8080
