pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = 'docker-hub-credentials-id' // ID ваших учетных данных Docker Hub
        IMAGE_NAME = 'trifonovada/webapp' // Имя вашего образа в Docker Hub
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

        stage('Cleanup') {
            steps {
                echo 'Cleaning up Docker...'
                sh "docker rmi ${IMAGE_NAME}:${env.BUILD_NUMBER}"
            }
        }
    }
}

