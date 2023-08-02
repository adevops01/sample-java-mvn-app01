pipeline {
    agent any
    
    environment { 
        DOCKER_CRED = credentials('docker')
      }
    
    stages {
        
        stage('Clone') {
            steps {
                git 'https://github.com/adevops01/sample-java-mvn-app01.git'
            }
        }
// Building insdie the container directly
        // stage('Build') {
        //     steps {
        //         mvn install
        //     }
        // }

        stage('Containerized'){
            steps{
                sh 'docker build -t moshab679/myapp:23.v1 .'
            }
        }

        stage('Upload to DockerHub'){
            steps {
                sh "docker login -u ${DOCKER_CRED_USR} -p ${DOCKER_CRED_PSW}"  
                sh 'docker push moshab679/myapp:23.v1'
            }
        }
    }
}
