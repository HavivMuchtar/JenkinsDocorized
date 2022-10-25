pipeline {
    agent any

    stages {
        stage('Checkout From SCM') {
            steps {
                echo 'Checkout from SCM..'
            }
        }
        stage('Pre-build stg') {
            steps {
                echo 'prebuild actions..'
            }
        }
        stage('Build') {
            steps {
              sh 'echo "docker build --target Build"'
            }
        }
        stage('Test') {
            steps {
                echo 'docker build --target test'
            }
        }
        stage('security') {
            steps {
                sh 'echo "this is security"'
            }
        }
        stage('Back-end') {
            steps {
                sh 'echo "mvn --version"'
            }
        }
        stage('Front-end') {
            steps {
                sh 'echo "node --version"'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "s3 cp src dst"'
            }
        }
        stage('Post') {
            steps {
                echo "clear env"
            }
        }
    }
}
