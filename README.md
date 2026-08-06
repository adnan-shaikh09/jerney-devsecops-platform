# 🚀 Jerney - End-to-End DevSecOps Platform

> A production-grade cloud-native full-stack application demonstrating modern DevOps and DevSecOps practices using Docker, Kubernetes, GitHub Actions, ArgoCD, Terraform, Trivy, PostgreSQL, Nginx, and AWS.

---

## 📖 Overview
Jerney is an end-to-end DevSecOps project that demonstrates how modern applications are built, secured, containerized, deployed, and continuously delivered using industry-standard tools and best practices.

The project showcases the complete software delivery lifecycle—from writing code to automated CI/CD, container security scanning, Kubernetes orchestration, GitOps deployment, and cloud infrastructure provisioning.

This repository is intended to demonstrate practical DevOps skills used in production environments.

---

# 🏗️ Project Architecture

```
                    Developer
                        │
                        ▼
                 GitHub Repository
                        │
                        ▼
            GitHub Actions (CI Pipeline)
                        │
        ┌───────────────┴────────────────┐
        │                                │
        ▼                                ▼
   Trivy Security Scan          Build Docker Images
                                        │
                                        ▼
                             Push Images to Docker Hub
                                        │
                                        ▼
                          Update Kubernetes Manifests
                                        │
                                        ▼
                              ArgoCD (GitOps)
                                        │
                                        ▼
                            Kubernetes Cluster
                                        │
               ┌────────────────────────┼────────────────────────┐
               ▼                        ▼                        ▼
         React Frontend          Node.js Backend         PostgreSQL Database
                                        │
                                        ▼
                                AWS Cloud Infrastructure
                              (Provisioned using Terraform)
```

---

# ✨ Features

- Full Stack Application (React + Node.js + PostgreSQL)
- Multi-stage Docker Builds
- Multi-Container Deployment using Docker Compose
- Nginx Reverse Proxy
- PostgreSQL Database
- GitHub Actions CI Pipeline
- Docker Image Build & Push
- Trivy Vulnerability Scanning
- Kubernetes Deployment
- GitOps using ArgoCD
- Infrastructure as Code using Terraform
- AWS Cloud Deployment
- Health Checks
- Persistent Docker Volumes
- Secure Non-Root Containers
- Read-Only Container Filesystem
- Production Ready Deployment Architecture

---

# 🛠️ Technology Stack

## Frontend

- React
- Vite
- HTML5
- CSS3
- JavaScript

## Backend

- Node.js
- Express.js

## Database

- PostgreSQL

## Web Server

- Nginx

## Containerization

- Docker
- Docker Compose

## CI/CD

- GitHub Actions

## Security (DevSecOps)

- Trivy

## Container Registry

- Docker Hub

## Orchestration

- Kubernetes

## GitOps

- ArgoCD

## Infrastructure as Code

- Terraform

## Cloud

- AWS EC2

## Operating System

- Ubuntu Linux

---

# 📂 Project Structure

```
jerney_project/
│
├── frontend/
│   ├── src/
│   ├── Dockerfile
│   └── nginx.conf
│
├── backend/
│   ├── src/
│   ├── Dockerfile
│   └── package.json
│
├── terraform/
│
├── k8s/
│
├── deploy/
│
├── docker-compose.yml
│
└── README.md
```

---

# 🚀 Getting Started

## Clone Repository

```bash
git clone https://github.com/<your-username>/jerney-devsecops-platform.git

cd jerney-devsecops-platform
```

---

## Start Application

```bash
docker compose up --build -d
```

---

## Verify Running Containers

```bash
docker compose ps
```

---

## Stop Application

```bash
docker compose down
```

---

# 🔄 CI/CD Pipeline

The project follows an automated Continuous Integration and Continuous Deployment workflow.

### CI Pipeline

- Source code pushed to GitHub
- GitHub Actions workflow triggered
- Install project dependencies
- Build frontend & backend
- Run code quality checks
- Build Docker images
- Perform Trivy security scan
- Push Docker images to Docker Hub

### CD Pipeline

- Kubernetes manifests updated
- ArgoCD detects Git changes
- Kubernetes cluster synchronizes automatically
- Updated application deployed

---

# 🔒 Security Best Practices

- Non-root Docker containers
- Read-only container filesystem
- Multi-stage Docker builds
- Trivy vulnerability scanning
- Minimal production images
- Health checks
- Secure environment variables
- Persistent database volumes

---

# ☁️ Infrastructure

Infrastructure is provisioned using Terraform on AWS.

Services include:

- EC2
- VPC
- Security Groups
- Docker Host
- Kubernetes Deployment
- Networking

---

# 📊 Future Enhancements

- Jenkins Pipeline
- SonarQube Integration
- Prometheus Monitoring
- Grafana Dashboards
- Loki Logging
- Helm Charts
- AWS EKS Deployment
- AWS ALB Ingress Controller
- Horizontal Pod Autoscaler
- Redis Caching
- Secrets Management
- SSL using Let's Encrypt
- GitHub Container Registry
- AWS CloudWatch Monitoring

---

# 📸 Screenshots

> Screenshots and architecture diagrams will be added soon.

---

# 🎯 Learning Objectives

This project demonstrates practical experience with:

- Docker
- Docker Compose
- Kubernetes
- GitHub Actions
- Trivy
- ArgoCD
- GitOps
- Terraform
- AWS
- PostgreSQL
- Nginx
- Linux
- CI/CD
- DevSecOps
- Cloud Native Deployment

---

# 🤝 Contributing

Contributions, suggestions, and improvements are welcome.

Feel free to fork the repository and submit a Pull Request.

---

# 👨‍💻 Author

**Adnan Shaikh**

DevOps Engineer | AWS Cloud | Docker | Kubernetes | GitHub Actions | Terraform | ArgoCD | Linux | PostgreSQL

LinkedIn: https://www.linkedin.com/in/<your-profile>

GitHub: https://github.com/<your-username>

---

# ⭐ Support

If you found this project useful, consider giving it a ⭐ on GitHub.
