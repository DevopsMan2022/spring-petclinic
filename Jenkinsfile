#!groovy
pipeline{
    agent { label 'JDK8'}
    triggers{
        cron('0 * * * *')
    }

    stages{
    
        stage('Source Code') {
            steps {
                git url: 'https://github.com/DevopsMan2022/spring-petclinic.git', 
                branch: 'branch_develop1'
            }
        }
        stage('Build the code'){
            steps{
                sh script: "mvn clean package"
            }
        }
        stage('Publish test results'){
            steps{
                junit testResults: 'target/surefire-reports/*.xml'
            }
        }
        stage('Build the docker image'){
            agent any
            steps{
                sh script: 'docker build -t spc1.1 .'
            }
        }
        stage('Push the docker image to registry'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerusercreds', passwordVariable: 'dockerusercredsPassword', usernameVariable: 'dockerusercredsUser')]){
                    sh docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}
                    sh script: docker push devopsman2022/myspringpetclinic1.1:spc1.1
                }
                
            }
        }
    }
}
