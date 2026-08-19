# student-mgmt-eureka-server

## Student Information
| Field | Value |
|-------|-------|
| **Student Name** | [Your Full Name] |
| **Student Number** | [Your Student ID] |
| **Slack Handle** | [Your Slack Username] *(Optional)* |
| **GCP Project ID** | [your-gcp-project-id] |

## Project Description
Spring Cloud Netflix Eureka Service Registry for the Student Management System. All microservices register here and discover each other through this registry.

- **Dashboard:** `http://<host>:8761`

## Technology Stack
- Java 25
- Spring Boot (latest)
- Spring Cloud Netflix Eureka Server
- Maven

## Port
`8761`

## Setup / Getting Started

### Prerequisites
- Java 25
- Maven
- Config Server must be running on port 8888

### Build
```bash
mvn clean package -DskipTests
```

### Run Locally
```bash
java -jar target/eureka-server.jar
```

## Architecture
Eureka Server starts **SECOND** (after Config Server). All platform services and business microservices register themselves here on startup. The API Gateway uses Eureka to discover service instances for load-balanced routing.

```
Registered Services:
  ├── API-GATEWAY        (port 8080)
  ├── STUDENT-SERVICE    (port 8081)
  ├── COURSE-SERVICE     (port 8082)
  └── ENROLLMENT-SERVICE (port 8083)
```
