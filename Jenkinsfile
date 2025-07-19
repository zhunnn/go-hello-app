pipeline {
  agent any

  environment {
    IMAGE_NAME = "localhost:5010/go-hello:latest"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Go') {
      steps {
        sh 'go mod tidy || true'  // 可選
        sh 'go build -o server .'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME .'
      }
    }

    stage('Push to Local Registry') {
      steps {
        sh 'docker push $IMAGE_NAME'
      }
    }

    // Optional: 可加一個步驟去修改 deployment.yaml 或 git push 更新
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
