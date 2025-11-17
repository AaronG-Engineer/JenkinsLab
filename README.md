# JenkinsLab – CI/CD Pipeline on Kubernetes

![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestration-blue) ![Jenkins](https://img.shields.io/badge/Jenkins-CI%2FCD-red) ![Helm](https://img.shields.io/badge/Helm-Deployment-blue)

## 🎯 Purpose
Demonstrates containerized CI/CD pipeline deployment using Kubernetes, showcasing automated build and deployment workflows for cloud-native applications.

## 🏗️ Architecture
- **Kubernetes Cluster** (Rancher Desktop with K3s)
- **Jenkins Controller** (Deployed via Helm)
- **Jenkins Agents** (Kubernetes pods)
- **Multi-stage Pipeline** (Build, Test, Deploy)

## ⚙️ Technical Implementation

### Deployment Steps
```bash
# Install Jenkins via Helm
helm repo add jenkins https://charts.jenkins.io
helm install jenkins jenkins/jenkins --namespace jenkins

# Access Jenkins UI
kubectl --namespace jenkins port-forward svc/jenkins 8080:8080

# Get admin credentials
kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- \
  /bin/cat /run/secrets/additional/chart-admin-password
```

### Pipeline Configuration
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

## 🎯 Key Features
- ✅ Containerized Jenkins deployment on Kubernetes
- ✅ Automated CI/CD pipeline execution
- ✅ GitHub webhook integration
- ✅ Multi-stage pipeline validation
- ✅ Dashboard and CLI monitoring

## 📊 Results
- **Deployment Time:** < 5 minutes via Helm
- **Build Time:** ~2-3 minutes per pipeline
- **Agent Scaling:** Dynamic pod creation
- **Platform:** Cross-platform (Windows/Linux via WSL2)

## 🔧 Technical Highlights
- Kubernetes-native CI/CD orchestration
- Helm chart management for consistent deployments
- Jenkins distributed builds across multiple agents
- Container networking and troubleshooting
- WSL2 runtime issue resolution

## 📈 Future Enhancements
- [ ] GitOps integration with automated GitHub triggers
- [ ] Advanced pipeline features (parallel stages, approval gates)
- [ ] RBAC and secrets management implementation
- [ ] Multi-environment deployment workflows
- [ ] Prometheus and Grafana monitoring stack

---

**Built with:** Kubernetes | Jenkins | Helm | Docker | GitHub Actions

**Tags:** `kubernetes` `jenkins` `cicd` `helm` `automation` `devops` `containerization`
