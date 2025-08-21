pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/DevanshiKaneria/The-Perfume-Shop'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("perfume-site:latest")
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh 'docker run -d -p 8080:80 perfume-site:latest'
                }
            }
        }
    }
}
