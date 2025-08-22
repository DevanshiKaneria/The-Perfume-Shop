pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh "docker build -t perfume-website:${env.BUILD_ID} ."
            }
        }
        stage('Deploy') {
            steps {
                sh "docker stop perfume-container || true"
                sh "docker rm perfume-container || true"
                sh "docker run -d -p 8088:80 --name perfume-container perfume-website:${env.BUILD_ID}"
            }
        }
    }
}