#!groovy
pipeline{
    agent { label 'JDK11'}
    triggers{
        cron('0 * * * *')
    }

    stages{
    
        stage('Source Code') {
            agent any
            steps {
                git url: 'https://github.com/DevopsMan2022/spring-petclinic.git', 
                branch: 'branch_develop1'
            }
        }
        stage('Build the code'){
            steps{
                sh "mvn package"
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
                sh "docker build image -t devopsman2022/myspringpetclinic1.1:spc1.1 ."
            }
        }
        stage('Push the docker image to registry'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerusercreds', passwordVariable: 'dockerusercredsPassword', usernameVariable: 'dockerusercredsUser')]){
                sh " docker login -u ${dockerusercredsUser} -p ${dockerusercredsPassword}"
                sh " docker push devopsman2022/myspringpetclinic1.1:spc1.1"
                }
                
            }
        }
    }
}
