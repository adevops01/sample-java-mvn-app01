pipeline {
    agent any

    stages {
        
        stage('Clone') {
            steps {
                git 'https://github.com/adevops01/sample-java-mvn-app01.git'
            }
        }

        stage('Build') {
            steps {
                mvn install
            }
        }

        stage('Containerized'){
            steps{
                sh 'docker build -t moshab679/myapp:23.v1 .'
            }
        }

        stage('Upload to Jfrog'){
            steps {
                sh 'docker push moshab679/myapp:23.v1'
            }
        }
    }
}