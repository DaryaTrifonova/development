
pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = "trifonovada/webapp"
        DOCKER_HUB_USER = "trifonovada"
        DOCKER_HUB_PASSWORD = credentials('docker-hub-credentials-id')
        STAGE_SERVER = "test_admin@172.20.10.7"
        DOCKER_COMPOSE_DIR = "/home/test_admin/web-dev-2024-2-exam-main/app/docker-compose.yaml"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/DaryaTrifonova/development.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_HUB_REPO/web-app .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'docker-hub-credentials-id', variable: 'DOCKER_HUB_PASSWORD')]) {
                        sh """
                        echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USER --password-stdin
                        docker push $DOCKER_HUB_REPO/web-app
                        """
                    }
                }
            }
        }

        stage('Deploy to Stage') {
            steps {
                sshagent(['ssh-credentials-id']) {
                    sh """
                    ssh $STAGE_SERVER "
                    cd $DOCKER_COMPOSE_DIR &&
                    docker-compose pull &&
                    docker-compose up -d
                    "
                    """
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed!'
        }
    }
}

