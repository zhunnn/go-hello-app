pipeline {
  agent any

  environment {
    IMAGE_NAME = "host.docker.internal:5010/go-hello:latest"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Use Minikube Docker') {
      steps {
        sh 'eval $(minikube docker-env)'
        sh 'docker build -t $IMAGE_NAME .'
      }
    }
  }

  post {
    success {
      echo "✅ Build & push image success: $IMAGE_NAME"
    }
    failure {
      echo "❌ Failed to build or push image"
    }
  }
}
