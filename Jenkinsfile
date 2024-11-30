pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'docker-hub-credentials-id' // ID ваших учетных данных Docker Hub
        IMAGE_NAME = 'trifonovada/webapp' // Имя вашего образа в Docker Hub
        DEPLOY_SERVER = '172.20.10.7' // Адрес stage-сервера
        SSH_CREDENTIALS = 'ssh-credentials-id' // ID SSH-ключа для сервера
        DOCKER_COMPOSE_FILE = 'docker-compose.yaml' // Имя файла docker-compose
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    sh "docker build -t ${IMAGE_NAME}:${env.BUILD_NUMBER} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        sh "docker push ${IMAGE_NAME}:${env.BUILD_NUMBER}"
                    }
                }
            }
        }

        stage('Deploy to Stage') {
            steps {
                echo 'Deploying application to Stage server...'
                script {
                    sshagent([SSH_CREDENTIALS]) {
                        sh """
                        ssh -o StrictHostKeyChecking=no user@${DEPLOY_SERVER} <<EOF
                        docker pull ${IMAGE_NAME}:${env.BUILD_NUMBER}
                        cd /path/to/deployment/directory
                        echo "Updating docker-compose.yaml..."
                        sed -i 's|image: ${IMAGE_NAME}:.*|image: ${IMAGE_NAME}:${env.BUILD_NUMBER}|' ${DOCKER_COMPOSE_FILE}
                        echo "Restarting application..."
                        docker-compose down && docker-compose up -d
                        EOF
                        """
                    }
                }
            }
        }

        stage('Cleanup') {
            steps {
                echo 'Cleaning up Docker...'
                sh "docker rmi ${IMAGE_NAME}:${env.BUILD_NUMBER}"
            }
        }
    }
}


