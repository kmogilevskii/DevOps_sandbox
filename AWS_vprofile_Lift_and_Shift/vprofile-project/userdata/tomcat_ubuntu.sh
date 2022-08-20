#!/bin/bash
sudo apt update
sudo apt -y remove needrestart
sudo apt upgrade -y
sudo apt install openjdk-8-jdk -y
sudo apt install tomcat8 tomcat8-admin tomcat8-docs tomcat8-common git -y
sudo apt install maven -y
git clone -b aws-LiftAndShift https://github.com/devopshydclub/vprofile-project.git
cd vprofile-project
mvn install
sudo systemctl stop tomcat
sudo rm -rf /var/lib/tomcat8/webapps/ROOT*
sudo cp target/vprofile-v2.war /var/lib/tomcat8/webapps/ROOT.war
sudo mkdir -p /var/lib/tomcat8/webapps/ROOT/WEB-INF/classes
sudo cp src/main/resources/application.properties /var/lib/tomcat8/webapps/ROOT/WEB-INF/classes/application.properties
sudo systemctl start tomcat
sudo systemctl enable tomcat