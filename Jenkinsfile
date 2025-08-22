pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Pull the latest code from your GitHub repository
                git 'https://github.com/YOUR_USERNAME/The-Perfume-Shop.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build a new Docker image from the Dockerfile
                script {
                    docker.build("perfume-website:${env.BUILD_ID}", ".")
                }
            }
        }
        stage('Deploy') {
            steps {
                // Stop and remove the old container to avoid conflicts
                sh 'docker stop perfume-container || true'
                sh 'docker rm perfume-container || true'

                // Run a new container with the newly built image
                sh "docker run -d -p 8080:80 --name perfume-container perfume-website:${env.BUILD_ID}"
            }
        }
    }
}
