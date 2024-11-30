pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'trifonovada/webapp' // Замените на ваш репозиторий
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials-id'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Клонируем репозиторий
                git branch: 'master', url: 'https://github.com/DaryaTrifonova/development.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Собираем Docker-образ
                script {
                    docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                // Пушим образ в Docker Hub
                script {
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_CREDENTIALS_ID) {
                        docker.image("${DOCKER_IMAGE}:latest").push()
                    }
                }
            }
        }
    }
}
