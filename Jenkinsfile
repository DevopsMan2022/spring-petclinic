pipeline{
    agent{ label 'JDK8'}
    options{
        timeout(unit: 'SECONDS', time: 5)\
        retry(1)
    }
    triggers { 
        cron('H */1 * * 1-5') 
        }
    stages {
        stage('Source Code') {
            steps {
                git url: 'https://github.com/DevopsMan2022/spring-petclinic.git', 
                branch: 'main'
            }
        }
        stage('Build the code'){
            steps {
                sh script: 'mvn clean package'
            }
        }
        stage('reporting') {
            steps {
                junit testResults: 'target/surefire-reports/*.xml'
            }

        }
    }
    post {
        success {
            // send the success email
            echo "Success"
            mail bcc: '', body: "BUILD URL: ${BUILD_URL} TEST RESULTS ${RUN_TESTS_DISPLAY_URL} ", cc: '', from: 'devops@qtdevops.com', replyTo: '', 
                subject: "${JOB_BASE_NAME}: Build ${BUILD_ID} Succeded", to: 'qtdevops@gmail.com'
        }
        unsuccessful {
            //send the unsuccess email
            mail bcc: '', body: "BUILD URL: ${BUILD_URL} TEST RESULTS ${RUN_TESTS_DISPLAY_URL} ", cc: '', from: 'devops@qtdevops.com', replyTo: '', 
                subject: "${JOB_BASE_NAME}: Build ${BUILD_ID} Failed", to: 'qtdevops@gmail.com'
        }
    }
    }
    