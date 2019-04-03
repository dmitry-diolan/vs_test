pipeline {
    agent any
    
    triggers {
        pollSCM('H/5 * * * *')
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Building2..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing2..'
            }
        }
    }
}
