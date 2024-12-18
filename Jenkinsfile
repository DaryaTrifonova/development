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

        stage('Checkout Code') {
            steps {
                git branch: 'master', url: 'https://github.com/DaryaTrifonova/development.git'
            }
        }

       stage('Deploy to Stage') {
        steps {
            echo 'Deploying application to Stage server...'
            script {
                if (!env.BUILD_NUMBER?.isInteger()) {
                    error "BUILD_NUMBER is not valid: ${env.BUILD_NUMBER}"
                }
                sh """#!/bin/bash
                ssh test_admin@192.168.87.237 "docker pull trifonovada/webapp:${env.BUILD_NUMBER} && docker-compose up -d"
                """
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


