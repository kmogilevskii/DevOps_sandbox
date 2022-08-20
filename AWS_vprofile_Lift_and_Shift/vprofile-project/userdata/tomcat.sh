#!/bin/bash
sudo apt update
sudo apt -y remove needrestart
sudo apt upgrade -y
sudo apt install openjdk-8-jdk -y
sudo apt install tomcat8 tomcat8-admin tomcat8-docs tomcat8-common git -y
sudo apt install maven -y
git clone https://github.com/kmogilevskii/DevOps_sandbox.git
cd DevOps_sandbox/AWS_vprofile_Lift_and_Shift/vprofile-project
mvn install
sudo systemctl stop tomcat8
sudo rm -rf /var/lib/tomcat8/webapps/ROOT*
sudo cp target/vprofile-v2.war /var/lib/tomcat8/webapps/ROOT.war

sudo systemctl start tomcat8
sudo systemctl enable tomcat8

# sudo mkdir -p /var/lib/tomcat8/webapps/ROOT/WEB-INF/classes
# sudo cp src/main/resources/application.properties /var/lib/tomcat8/webapps/ROOT/WEB-INF/classes/application.properties