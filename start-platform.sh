#!/bin/bash
echo "=========================================="
echo "Starting Platform Services (Config, Gateway, Eureka)"
echo "=========================================="

# Update and install dependencies
sudo apt-get update
sudo apt-get install -y git default-jdk maven

# Setup Workspace
cd ~
rm -rf student-mgmt-platform
git clone https://github.com/nipun-imesh/student-mgmt-platform.git
cd student-mgmt-platform

export GCP_PROJECT_ID=cloud-cw-506106

# Start Eureka
echo "Starting Eureka Server..."
cd eureka-server
mvn clean install -DskipTests
nohup java -jar target/*.jar > eureka.log 2>&1 &
cd ..

sleep 10

# Start Config Server
echo "Starting Config Server..."
cd config-server
mvn clean install -DskipTests
nohup java -jar target/*.jar > config.log 2>&1 &
cd ..

sleep 10

# Start API Gateway
echo "Starting API Gateway..."
cd api-gateway
mvn clean install -DskipTests
nohup java -jar target/*.jar > gateway.log 2>&1 &
cd ..

echo "All Platform Services Started in Background!"
echo "Please keep this terminal open or minimized until Load Balancers turn Green."
