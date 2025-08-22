// Jenkinsfile (NEW, CORRECTED VERSION)
pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("perfume-website:${env.BUILD_ID}", ".")
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker stop perfume-container || true'
                sh 'docker rm perfume-container || true'
                sh "docker run -d -p 8081:80 --name perfume-container perfume-website:${env.BUILD_ID}"
            }
        }
    }
}