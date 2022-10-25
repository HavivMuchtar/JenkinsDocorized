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
            agent {
                any { image 'alpine:latest' }
            }
            steps {
                sh 'echo this is security'
            }
        }
        stage('Back-end') {
            agent {
                any { image 'maven:3.8.1-adoptopenjdk-11' }
            }
            steps {
                sh 'echo "mvn --version"'
            }
        }
        stage('Front-end') {
            agent {
                any { image 'node:16.13.1-alpine' }
            }
            steps {
                sh 'node --version'
            }
        }
        stage('Deploy') {
            agent {
                any { image 'aws-cli:latest' }
            }
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
