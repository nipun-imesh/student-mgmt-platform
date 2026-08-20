#!/bin/bash
echo "=========================================="
echo "Starting Microservices & Frontend Webapp"
echo "=========================================="

# Update and install dependencies
sudo apt-get update
sudo apt-get install -y git default-jdk maven nginx

# 1. Setup Frontend
echo "Starting Frontend on port 80..."
cd ~
rm -rf student-mgmt-frontend
git clone https://github.com/nipun-imesh/student-mgmt-frontend.git
sudo cp -r student-mgmt-frontend/* /var/www/html/
sudo systemctl restart nginx

# 2. Setup Services
cd ~
rm -rf student-mgmt-services
git clone https://github.com/nipun-imesh/student-mgmt-services.git
cd student-mgmt-services

export GCP_PROJECT_ID=cloud-cw-506106

# Start Student Service
echo "Starting Student Service..."
cd student-service
mvn clean install -DskipTests
nohup java -jar target/*.jar > student.log 2>&1 &
cd ..

sleep 10

# Start Course Service
echo "Starting Course Service..."
cd course-service
mvn clean install -DskipTests
nohup java -jar target/*.jar > course.log 2>&1 &
cd ..

sleep 10

# Start Enrollment Service
echo "Starting Enrollment Service..."
cd enrollment-service
mvn clean install -DskipTests
nohup java -jar target/*.jar > enrollment.log 2>&1 &
cd ..

echo "All Microservices & Frontend Started in Background!"
echo "Please keep this terminal open or minimized until Load Balancers turn Green."
