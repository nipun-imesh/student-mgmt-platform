# student-mgmt-api-gateway

## Student Information
| Field | Value |
|-------|-------|
| **Student Name** | [Your Full Name] |
| **Student Number** | [Your Student ID] |
| **Slack Handle** | [Your Slack Username] *(Optional)* |
| **GCP Project ID** | [your-gcp-project-id] |

## Project Description
Spring Cloud Gateway — single entry point for all backend microservices in the Student Management System. Routes requests to the appropriate microservice via Eureka service discovery with client-side load balancing.

## Technology Stack
- Java 25
- Spring Boot (latest)
- Spring Cloud Gateway
- Spring Cloud Netflix Eureka Client
- Maven

## Port
`8080`

## Setup / Getting Started

### Prerequisites
- Java 25
- Maven
- Config Server running on port 8888
- Eureka Server running on port 8761

### Build
```bash
mvn clean package -DskipTests
```

### Run Locally
```bash
java -jar target/api-gateway.jar
```

## API Endpoints (Routing)
| Route | Target Service | Endpoint Pattern |
|-------|---------------|-----------------|
| Student Service | `lb://STUDENT-SERVICE` | `/api/students/**` |
| Course Service | `lb://COURSE-SERVICE` | `/api/courses/**` |
| Enrollment Service | `lb://ENROLLMENT-SERVICE` | `/api/enrollments/**` |

## Architecture
The API Gateway starts **THIRD** (after Config Server and Eureka). It receives all incoming requests from the Load Balancer and routes them to the appropriate microservice. CORS is configured to allow frontend requests from Cloud Run.
