pipeline {
    agent any
    tools {
        maven 'maven'
        jdk 'JDK'
    }
    stages {
        stage('Git Clone') {
            steps {
                echo 'Clone Github Source code'
                git credentialsId: '23a41ef3-9c8b-41ef-ba7e-17c6fdcf5928', url: 'https://github.com/sharan9611/MavenProject.git'
            }
        }
        stage('Maven Build') {
            steps {
                echo 'maven build step'
                sh 'maven clean install'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy war file to Tomcat server'
                deploy adapters: [tomcat9(credentialsId: 'f1a32f95-41e7-441c-b5db-04a67c797c93', path: '', url: 'http://13.127.148.143:8084')], contextPath: null, war: '*/*.war'
            }
        }
    }    
}        
