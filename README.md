# 🧪 JenkinsLab: CI/CD Pipeline on Kubernetes with Rancher Desktop & Minikube

> **A hands-on DevOps lab demonstrating complete CI/CD pipeline implementation using Jenkins in local Kubernetes clusters**

[![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white)](https://jenkins.io/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://docker.com/)
[![WSL](https://img.shields.io/badge/WSL2-0078D4?style=for-the-badge&logo=windows&logoColor=white)](https://docs.microsoft.com/en-us/windows/wsl/)

## 📋 Table of Contents
- [Overview](#overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Setup & Installation](#setup--installation)
- [Pipeline Configuration](#pipeline-configuration)
- [Troubleshooting](#troubleshooting)
- [Results & Screenshots](#results--screenshots)
- [Key Learnings](#key-learnings)
- [Next Steps](#next-steps)

## 🚀 Overview

JenkinsLab is a comprehensive DevOps project where I built and documented a complete CI/CD pipeline using Jenkins deployed in local Kubernetes clusters. This project showcases real-world DevOps workflows including system troubleshooting, container orchestration, and pipeline automation.

### What This Project Demonstrates
- **System Administration**: Resolved WSL2 and containerd runtime issues
- **Kubernetes Operations**: Deployed and managed local K8s clusters using Rancher Desktop and Minikube
- **CI/CD Implementation**: Configured Jenkins pipelines with Groovy scripting
- **Infrastructure as Code**: Used Helm charts for application deployment
- **Monitoring & Observability**: Tracked cluster health and deployment status

## 🏗️ Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Windows 11    │    │   WSL2 Ubuntu    │    │  Rancher Desktop│
│   PowerShell    │◄───┤   20.04.3 LTS    │◄───┤   K3s Engine    │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                                                         │
                                                         ▼
┌─────────────────────────────────────────────────────────────────┐
│                    Kubernetes Cluster                          │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐           │
│  │   Jenkins   │  │   Sample    │  │   Nginx     │           │
│  │   Master    │  │   App       │  │   Ingress   │           │
│  └─────────────┘  └─────────────┘  └─────────────┘           │
└─────────────────────────────────────────────────────────────────┘
```

## 📋 Prerequisites

- **OS**: Windows 11 Pro with Hyper-V enabled
- **WSL2**: Ubuntu 20.04.3 LTS or later
- **Container Runtime**: Docker Desktop or Rancher Desktop
- **Tools**: kubectl, Helm, Git

## ⚙️ Setup & Installation

### 1. 🔧 WSL2 Configuration

First, I resolved WSL2 provisioning issues that were blocking containerd:

```powershell
# Reset WSL registry keys
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\System" -Name "defaultUser" -Value "_aarongdev"

# Provision WSL with custom user
wsl --install
```

![WSL Provisioning](images/wsl_provisioning_terminal.png)
*WSL2 Ubuntu provisioning with custom user account*

### 2. 🐳 Rancher Desktop Setup

Installed and configured Rancher Desktop with K3s engine:

```bash
# Verify Kubernetes cluster
kubectl get nodes
kubectl get pods --all-namespaces
```

![Rancher Dashboard](images/rancher_dashboard.png)
*Rancher Desktop showing healthy K3s cluster*

### 3. 📦 Jenkins Installation via Helm

```bash
# Add Jenkins Helm repository
helm repo add jenkins https://charts.jenkins.io
helm repo update

# Create namespace and install Jenkins
kubectl create namespace jenkins
helm install jenkins jenkins/jenkins --namespace jenkins

# Get Jenkins admin password
kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo
```

### 4. 🌐 Access Configuration

```bash
# Port forward to access Jenkins UI
kubectl --namespace jenkins port-forward svc/jenkins 8080:8080
```

## 🔄 Pipeline Configuration

Created a multi-stage Jenkins pipeline using Groovy:

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying to production...'
            }
        }
    }
}
```

![Jenkins Pipeline](images/jenkins_pipeline_config.png)
*Jenkins pipeline configuration showing multi-stage setup*

## 🎯 Results & Screenshots

### Jenkins Dashboard
![Jenkins Welcome](images/jenkins_dashboard.png)
*Jenkins dashboard showing successful installation and setup*

### Pipeline Execution
![Pipeline Console](images/jenkins_console_output.png)
*Console output showing successful pipeline execution with all stages*

### Kubernetes Deployments
![Rancher Deployments](images/rancher_deployments.png)
*Rancher Desktop showing nginx deployment in Kubernetes cluster*

### Project Setup Options
![Jenkins New Item](images/jenkins_new_item.png)
*Jenkins project type selection including Pipeline and Freestyle options*

## 🛠️ Troubleshooting

### Common Issues Resolved

1. **WSL2 Provisioning Failure**
   ```powershell
   # Solution: Reset registry and provision with custom user
   Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\System" -Name "defaultUser" -Value "_aarongdev"
   ```

2. **Containerd Runtime Issues**
   - Verified Hyper-V was enabled
   - Restarted Rancher Desktop after WSL fix
   - Confirmed K3s engine was running

3. **Jenkins Service Discovery**
   ```bash
   # Verify Jenkins service is running
   kubectl get svc -n jenkins
   kubectl get pods -n jenkins
   ```

## 🎓 Key Learnings

### Technical Skills Developed
- **Kubernetes Administration**: Deployed applications using Helm and kubectl
- **Container Orchestration**: Managed workloads across Rancher Desktop and Minikube
- **CI/CD Pipeline Design**: Implemented multi-stage builds with proper stage separation
- **System Troubleshooting**: Diagnosed and resolved WSL2 and container runtime issues
- **Infrastructure Documentation**: Created reproducible setup guides with visual evidence

### DevOps Best Practices Applied
- **Infrastructure as Code**: Used Helm charts for consistent deployments
- **Environment Consistency**: Validated setup across multiple K8s distributions
- **Pipeline as Code**: Version-controlled Jenkins pipeline definitions
- **Monitoring & Observability**: Used both CLI and dashboard tools for cluster visibility

## 🚀 Next Steps

### Planned Enhancements
- [ ] **GitOps Integration**: Connect Jenkins to GitHub webhooks for automated triggers
- [ ] **Advanced Pipeline Features**: Add parallel stages, approval gates, and artifact management
- [ ] **Security Hardening**: Implement RBAC, secrets management, and vulnerability scanning
- [ ] **Multi-Environment Deployment**: Set up dev/staging/prod promotion workflows
- [ ] **Monitoring Stack**: Deploy Prometheus and Grafana for observability

### Production Considerations
- [ ] **High Availability**: Multi-master Jenkins setup with persistent storage
- [ ] **Backup & Recovery**: Automated Jenkins configuration and job backup
- [ ] **Scalability**: Dynamic agent provisioning in Kubernetes
- [ ] **Integration Testing**: Automated testing with real application deployments

## 📊 Environment Details

| Component | Version | Purpose |
|-----------|---------|---------|
| Windows 11 Pro | 22H2 | Host OS |
| WSL2 Ubuntu | 20.04.3 LTS | Linux environment |
| Rancher Desktop | 1.6.0 | Kubernetes platform |
| K3s | v1.23.4+k3s1 | Lightweight Kubernetes |
| Jenkins | 2.516.2 | CI/CD automation |
| Helm | 3.10.0 | Package manager |

## 🤝 Contributing

This is a learning project, but I welcome feedback and suggestions! Feel free to:
- Open issues for questions or improvements
- Submit pull requests for documentation updates
- Share your own Jenkins/K8s experiences

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Built with ❤️ as part of my DevOps learning journey**

*This project demonstrates practical DevOps skills for my Cloud Resume Challenge and showcases my ability to build, document, and troubleshoot modern CI/CD infrastructure.*
