// Jenkinsfile (FINAL VERSION)
pipeline {
    // Use an agent that has Docker installed
    agent {
        docker {
            image 'docker:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

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
                // Deploying the website to port 8081
                sh "docker run -d -p 8081:80 --name perfume-container perfume-website:${env.BUILD_ID}"
            }
        }
    }
}