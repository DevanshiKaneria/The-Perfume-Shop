pipeline {
    agent {
        docker {
            image 'docker:20.10.24'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/DevanshiKaneria/The-Perfume-Shop',
                    credentialsId: 'github-token'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t perfume-site:latest .'
            }
        }

        stage('Run Container') {
            steps {
                // Stop old container if exists, then run new one
                sh '''
                    docker stop perfume-site || true
                    docker rm perfume-site || true
                    docker run -d -p 8080:80 --name perfume-site perfume-site:latest
                '''
            }
        }
    }
}
