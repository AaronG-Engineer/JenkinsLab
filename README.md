# 🧪 JenkinsLab: CI/CD Pipeline on Kubernetes with Rancher Desktop

As part of my CI/CD learning journey, I built **JenkinsLab**—a local Kubernetes environment powered by Rancher Desktop, where Jenkins runs inside a containerized cluster. This lab helped me troubleshoot WSL issues, validate container runtime setup, and configure a working Jenkins pipeline—all documented with screenshots and CLI output.

---

## 🧰 Environment

- **OS**: Windows 10 with WSL2
- **Container Runtime**: containerd via Rancher Desktop
- **Kubernetes**: K3s (v1.23.4+k3s1)
- **Orchestration**: Rancher UI
- **CI/CD Tool**: Jenkins (installed via Helm)

---

## ⚙️ Setup Process

### 1. ✅ Fixing WSL Errors
WSL was preventing the container engine from starting. I resolved this by:
- Resetting registry keys to set a default user
- Provisioning WSL with `aarongdev`
- Restarting the system and validating containerd startup

> 📸 Screenshot: WSL provisioning and successful launch of Ubuntu 20.04

---

### 2. 🧪 Verifying Rancher Desktop
After reboot, I confirmed Rancher Desktop was running:
- Kubernetes node registered
- Cluster events showed successful node registration and resource enforcement

> 📸 Screenshot: Rancher Dashboard with cluster health and event logs

---

### 3. 📦 Installing Jenkins via Helm
I created a dedicated namespace and installed Jenkins using Helm:

```bash
helm repo add jenkins https://charts.jenkins.io
helm repo update
kubectl create namespace jenkins
helm install jenkins jenkins/jenkins --namespace jenkins
