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

    stage('Build & Push Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME .'
        sh 'docker push $IMAGE_NAME'
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
