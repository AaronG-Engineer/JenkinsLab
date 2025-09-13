# 🧪 JenkinsLab: CI/CD Pipeline on Kubernetes with Rancher Desktop & Minikube

> **A hands-on DevOps lab demonstrating complete CI/CD pipeline implementation using Jenkins in local Kubernetes clusters**



[![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white)](https://jenkins.io/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://docker.com/)
[![WSL](https://img.shields.io/badge/WSL2-0078D4?style=for-the-badge&logo=windows&logoColor=white)](https://docs.microsoft.com/en-us/windows/wsl/)

## 📚 Table of Contents
- [Summary](#-summary)
- [Environment](#-environment)
- [Setup Process](#-setup-process)
  - [Provisioning WSL](#1--provisioning-wsl)
  - [Verifying Rancher Desktop](#2--verifying-rancher-desktop)
  - [Installing Jenkins via Helm](#3--installing-jenkins-via-helm)
  - [Jenkins Setup & Pipeline](#4--jenkins-setup--pipeline-configuration)
  - [Jenkins Interface & Plugins](#5--jenkins-interface--plugin-setup)
  - [Minikube Setup](#6--minikube-setup--cluster-verification)
  - [kubectl Verification](#7--kubectl-setup--pod-verification)
  - [Minikube App Deployment](#8--minikube-app-deployment)
  - [Kubernetes Dashboard](#9--kubernetes-dashboard-views)
  - [Rancher Cluster Overview](#10--bonus-rancher-cluster-overview)
- [Conclusion](#-conclusion)

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

### 2. 🐳 Rancher Desktop Setup

Installed and configured Rancher Desktop with K3s engine:

```bash
# Verify Kubernetes cluster
kubectl get nodes
kubectl get pods --all-namespaces
```

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

## 🎯 Results & Screenshots

### Jenkins Dashboard
![Jenkins Dashboard](https://raw.githubusercontent.com/AaronG-Engineer/JenkinsLab/main/assets/Jenkins_Dashboard.png)
*Jenkins dashboard showing successful installation and setup*

### Jenkins Console Output
![Jenkins Console Output](https://raw.githubusercontent.com/AaronG-Engineer/JenkinsLab/main/assets/Jenkins_Console_Output.png)
*Console output showing successful pipeline execution with all stages*

### Jenkins Create Job
![Jenkins Create](https://raw.githubusercontent.com/AaronG-Engineer/JenkinsLab/main/assets/Jenkins_Create.png)
*Creating a new Jenkins job with freestyle configuration*

### Jenkins Image
![Jenkins Image](https://raw.githubusercontent.com/AaronG-Engineer/JenkinsLab/main/assets/Jenkins_Image.png)
*Docker image used for Jenkins container setup*

### Rancher Cluster Running
![Local Kubernetes Cluster](https://raw.githubusercontent.com/AaronG-Engineer/JenkinsLab/main/assets/Local_Kubernetes%20cluster_running_Rancher.png)
*Local Kubernetes cluster running Rancher Desktop*

### Nginx Deployment
![My Nginx](https://raw.githubusercontent.com/AaronG-Engineer/JenkinsLab/main/assets/My_Nginx.png)
*Nginx pod deployed via kubectl*

### WSL Account Setup
![WSL Account](https://raw.githubusercontent.com/AaronG-Engineer/JenkinsLab/main/assets/WSL_account.png)
*WSL user account setup for local dev environment*

### Kubernetes Workloads
![K8s Dashboard Workloads](https://raw.githubusercontent.com/AaronG-Engineer/JenkinsLab/main/assets/k8s_dashboard_workloads.png)
*Kubernetes dashboard showing active workloads*

### Minikube Hello Service
![Minikube Hello Lifecycle](https://raw.githubusercontent.com/AaronG-Engineer/JenkinsLab/main/assets/minikube_hello_service_lifecycle.png)
*Lifecycle of a sample hello-world service in Minikube*

### Minikube Kubectl Setup
![Minikube Kubectl Setup](https://raw.githubusercontent.com/AaronG-Engineer/JenkinsLab/main/assets/minikube_kubectl_setup_and_pods.png)
*Kubectl setup and pod visibility in Minikube*

### Minikube Profile Recovery
![Minikube Start Recovery](https://raw.githubusercontent.com/AaronG-Engineer/JenkinsLab/main/assets/minikube_start_profile_recovery.png)
*Recovering Minikube profile after failed start*

### Pipeline Script
![Pipeline Script](https://raw.githubusercontent.com/AaronG-Engineer/JenkinsLab/main/assets/pipeline_script.png)
*Jenkins pipeline script showing stage definitions*

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


![GitHub last commit](https://img.shields.io/github/last-commit/AaronG-Engineer/JenkinsLab)
![GitHub repo size](https://img.shields.io/github/repo-size/AaronG-Engineer/JenkinsLab)
![GitHub](https://img.shields.io/github/license/AaronG-Engineer/JenkinsLab)

![Kubernetes](https://img.shields.io/badge/Kubernetes-v1.28-blue?logo=kubernetes)
![Jenkins](https://img.shields.io/badge/Jenkins-CI%2FCD-red?logo=jenkins)
![WSL2](https://img.shields.io/badge/WSL2-enabled-green?logo=windows)

**Built with ❤️ as part of my DevOps learning journey**

*This project demonstrates practical DevOps skills for my Cloud Resume Challenge and showcases my ability to build, document, and troubleshoot modern CI/CD infrastructure.*
