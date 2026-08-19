# student-mgmt-config-server

## Student Information
| Field | Value |
|-------|-------|
| **Student Name** | [Your Full Name] |
| **Student Number** | [Your Student ID] |
| **Slack Handle** | [Your Slack Username] *(Optional)* |
| **GCP Project ID** | [your-gcp-project-id] |

## Project Description
Spring Cloud Config Server for the Student Management System. Centralizes and externalizes configuration for all microservices. Reads configuration from the `student-mgmt-config-repo` GitHub repository.

## Technology Stack
- Java 25
- Spring Boot (latest)
- Spring Cloud Config Server
- Spring Cloud Netflix Eureka Client
- Maven

## Port
`8888`

## Setup / Getting Started

### Prerequisites
- Java 25
- Maven
- Access to `student-mgmt-config-repo` GitHub repository

### Build
```bash
mvn clean package -DskipTests
```

### Run Locally
```bash
java -jar target/config-server.jar
```

## API Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/{application}/{profile}` | Get config for application |
| GET | `/{application}/{profile}/{label}` | Get config with branch label |

## Architecture
The Config Server starts **FIRST** before all other services. It reads YAML configuration files from `student-mgmt-config-repo` and serves them to microservices on startup. Each microservice specifies `spring.config.import=configserver:http://localhost:8888` to fetch its configuration.
