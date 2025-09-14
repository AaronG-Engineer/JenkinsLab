pipeline {
  agent any

  stages {
    stage('Clone Repo') {
      steps {
        git 'https://github.com/AaronG-Engineer/JenkinsLab.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          docker.build('jenkinslab-demo')
        }
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        sh 'kubectl apply -f k8s/deployment.yaml'
        sh 'kubectl apply -f k8s/service.yaml'
      }
    }
  }
}
