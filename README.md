# 🧪 JenkinsLab: CI/CD Pipeline on Kubernetes with Rancher Desktop & Minikube

`JenkinsLab` is a hands-on DevOps lab where I built and documented a complete CI/CD pipeline using Jenkins inside local Kubernetes clusters. I deployed Jenkins via Helm in Rancher Desktop (K3s), resolved WSL and container runtime issues, and configured multi-stage pipelines—all while capturing the process with CLI output and dashboard screenshots.

This project reflects my ability to:
- Troubleshoot system-level blockers (WSL, containerd, Hyper-V)
- Deploy and manage Kubernetes clusters locally using Rancher Desktop and Minikube
- Install Jenkins via Helm and configure pipelines using Groovy
- Monitor cluster health and deployment status using Rancher UI and kubectl
- Document technical workflows for GitHub, freelance outreach, and interview prep

---

## 🧠 Summary

I started with a broken WSL setup that blocked containerd from launching. After fixing registry keys and provisioning WSL with a custom user (`aarongdev`), I validated Rancher Desktop’s Kubernetes engine and deployed Jenkins via Helm. I then configured a basic CI/CD pipeline with build, test, and deploy stages. To compare tooling, I also spun up Minikube and deployed a sample app using kubectl and the Kubernetes dashboard.

This lab simulates real-world DevOps workflows in a local environment, and every step is documented with screenshots and CLI output to showcase my technical credibility.

---

## 🧰 Environment

- **OS**: Windows 11 Pro with WSL2  
- **Container Runtime**: containerd via Rancher Desktop  
- **Kubernetes**: K3s (v1.23.4+k3s1) and Minikube (v1.28.0)  
- **CI/CD Tool**: Jenkins (installed via Helm)  
- **Orchestration**: Rancher UI and Kubernetes Dashboard  
- **Shells Used**: PowerShell, WSL (Ubuntu 20.04.3 LTS)

---

## ⚙️ Setup Process

### 1. ✅ Provisioning WSL

WSL was blocking containerd. I reset registry keys, provisioned WSL with a default user, and validated the Linux environment.

**Insert Image:**  
`![wsl_provisioning_terminal](7Fb5sJwjSsKFgxeUSJRqp.png)`

---

### 2. 🧪 Verifying Rancher Desktop

After reboot, I confirmed Rancher Desktop was running and Kubernetes was healthy.

**Insert Image:**  
`![rancher_cluster_events](ydSzS6GjMabGSHFhqUvPK.png)`

---

### 3. 📦 Installing Jenkins via Helm

I created a namespace and installed Jenkins using Helm.

```bash
helm repo add jenkins https://charts.jenkins.io
helm repo update
kubectl create namespace jenkins
helm install jenkins jenkins/jenkins --namespace jenkins

## 🧩 Conclusion

This lab was more than just a Jenkins install—it was a full-stack DevOps simulation built from the ground up. I resolved system-level blockers, deployed Jenkins in Kubernetes using Helm, configured a multi-stage pipeline, and validated the entire flow using both CLI and dashboard tools. Every step was documented with screenshots and terminal output to showcase transparency, reproducibility, and real-world problem-solving.

By comparing Rancher Desktop and Minikube, I gained hands-on insight into local Kubernetes orchestration and CI/CD tooling. This project reflects my approach to DevOps: strategic, iterative, and always documented. Whether I’m troubleshooting WSL or configuring a pipeline in Groovy, I focus on building systems that work—and telling the story clearly.

This lab is now part of my Cloud Resume Challenge and freelance portfolio. It’s a technical win, a credibility boost, and a foundation for deeper automation projects ahead.
