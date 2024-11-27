pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'trifonovada/webapp'        // Укажите ваш Docker-репозиторий
        DOCKER_HUB_USER = 'trifonovada'      // Ваш логин Docker Hub
        DOCKER_HUB_PASSWORD = credentials('docker-hub-password')  // Добавьте Docker Hub credentials в Jenkins
        STAGE_SERVER = 'test_admin@192.168.3.92'             // Укажите ваш stage-сервер
        DOCKER_COMPOSE_PATH = '/home/test_admin/web-dev-2024-2-exam-main/app/docker-compose.yml'  // Путь к docker-compose на вашем сервере
        REPO_URL = 'https://github.com/DaryaTrifonova/development.git'  // URL вашего репозитория
        BRANCH_NAME = 'dev'                            // Ветка, с которой происходит деплой
    }

    stages {
        stage('Checkout Code from GitHub') {
            steps {
                script {
                    // Клонируем репозиторий и переключаемся на нужную ветку
                    git url: "${REPO_URL}", branch: "${BRANCH_NAME}"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Строим Docker-образ с тегом latest
                    sh "docker build -t ${DOCKER_HUB_REPO}:latest ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Авторизация в Docker Hub
                    sh "echo \$DOCKER_HUB_PASSWORD | docker login -u \$DOCKER_HUB_USER --password-stdin"
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Публикуем образ в Docker Hub
                    sh "docker push ${DOCKER_HUB_REPO}:latest"
                }
            }
        }

        stage('Deploy Application on Stage Server') {
            steps {
                script {
                    // Подключаемся к stage-серверу и запускаем контейнеры с помощью docker-compose
                    sh """
                    ssh ${STAGE_SERVER} "
                    docker-compose -f ${DOCKER_COMPOSE_PATH} up -d
                    "
                    """
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    // Проверяем, что контейнеры запустились на stage-сервере
                    sh "ssh ${STAGE_SERVER} 'docker ps'"
                }
            }
        }

        stage('Git Pull Request & Merge') {
            steps {
                script {
                    // Создание ветки feature и внесение изменений (можно интегрировать с GitFlow)
                    // Здесь добавляется возможность сделать изменения и создать пул-реквест.

                    // Пример: пушим изменения в ветку feature и потом делаем pull request:
                    sh '''
                    git checkout -b feature/my-feature
                    # Внесение изменений в код
                    git add .
                    git commit -m "Added new feature"
                    git push origin feature/my-feature
                    '''
                    
                    // В GitFlow нужно сделать пул-реквест в ветку dev, после чего
                    // можно будет автоматически сделать деплой из ветки dev.
                }
            }
        }

        stage('Build Application from Dev Branch') {
            steps {
                script {
                    // Клонируем ветку dev и выполняем сборку
                    git branch: 'dev', url: 'https://github.com/yourusername/your-repository.git'

                    // Скачиваем Docker-образ из Docker Hub и запускаем контейнеры с помощью docker-compose
                    sh "docker pull ${DOCKER_HUB_REPO}:latest"
                    sh """
                    ssh ${STAGE_SERVER} "
                    docker-compose -f ${DOCKER_COMPOSE_PATH} up -d
                    "
                    """
                }
            }
        }

        stage('Deploy & Verify') {
            steps {
                script {
                    // Подключаемся к stage-серверу и проверяем, что приложение развернуто
                    sh "ssh ${STAGE_SERVER} 'docker ps'"
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully"
        }
        failure {
            echo "Pipeline failed"
        }
    }
}
