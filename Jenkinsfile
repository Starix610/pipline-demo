pipeline {
    agent any
    tools {
        maven 'my_maven'
        jdk 'my_jdk'
    }
    stages {
        stage('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '27038afc-e172-4978-8be2-353013988de8', url: 'https://github.com/Starix610/pipline-demo.git']]])
            }
        }
        stage('build') {
            steps {
                sh 'mvn clean package -Dmaven.test.skip=true'
            }
        }
        stage('deploy') {
            steps {
                echo "部署中..."
            }
        }
    }
}