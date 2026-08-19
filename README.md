# student-mgmt-platform

## Student Information
| Field | Value |
|-------|-------|
| **Student Name** | [Your Full Name] |
| **Student Number** | [Your Student ID] |
| **Slack Handle** | [Your Slack Username] *(Optional)* |
| **GCP Project ID** | [your-gcp-project-id] |

## Project Description
This is the **Platform Services** parent repository for the Student Management System. It contains Git Submodules for all Spring Cloud platform components:

| Submodule | Port | Role |
|-----------|------|------|
| `config-server` | 8888 | Centralized configuration (Spring Cloud Config) |
| `eureka-server` | 8761 | Service discovery & registry (Netflix Eureka) |
| `api-gateway` | 8080 | Single entry point / routing (Spring Cloud Gateway) |

## Repository Links
| Component | Repository |
|-----------|-----------|
| Config Server | [student-mgmt-config-server](https://github.com/<username>/student-mgmt-config-server) |
| Eureka Server | [student-mgmt-eureka-server](https://github.com/<username>/student-mgmt-eureka-server) |
| API Gateway | [student-mgmt-api-gateway](https://github.com/<username>/student-mgmt-api-gateway) |

## Technology Stack
- Java 25
- Spring Boot (latest)
- Spring Cloud (latest)
- Maven

## Service Startup Order
```
1. Config Server     (Port 8888)  ← Start FIRST
2. Eureka Server     (Port 8761)  ← Start SECOND
3. API Gateway       (Port 8080)  ← Start THIRD
```

## Clone with Submodules
```bash
git clone --recurse-submodules https://github.com/<username>/student-mgmt-platform
# If already cloned:
git submodule init
git submodule update
```

## Add Submodules (first time setup)
```bash
git submodule add https://github.com/<username>/student-mgmt-config-server config-server
git submodule add https://github.com/<username>/student-mgmt-eureka-server eureka-server
git submodule add https://github.com/<username>/student-mgmt-api-gateway api-gateway
git commit -m "Add platform submodules"
git push
```

## Architecture
This platform layer sits between the internet-facing Load Balancer and the business microservices. It handles:
- **Configuration management** via Config Server (reads from `student-mgmt-config-repo`)
- **Service registration & discovery** via Eureka Server
- **Request routing & load balancing** via API Gateway
