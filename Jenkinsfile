pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/DevanshiKaneria/The-Perfume-Shop.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t perfume-shop .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Stop old container if running
                    sh 'docker rm -f perfume-container || true'

                    // Run new one
                    sh 'docker run -d -p 8081:80 --name perfume-container perfume-shop'
                }
            }
        }
    }
}
