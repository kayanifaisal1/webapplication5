pipeline {
    agent any
    
    environment {
        MSBUILD_PATH = tool 'MSBuild'
        PUBLISH_DIR = "C:\\inetpub\\wwwroot"
    }
    
    stages {
        stage('Source') {
            steps {
                script {
                    // Set system property to allow local checkouts
                    System.setProperty('hudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT', 'true')
                }
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'file:///C:/Users/faisal.kayani/Desktop/New folder (4)/webapplication5']]])
            }
        }
        
        stage('Build') {
            steps {
                bat "\"${MSBUILD_PATH}\" my_app.sln /p:Configuration=Release /t:build"
            }
        }
        
        stage('Publish') {
            steps {
                bat "\"${MSBUILD_PATH}\" my_app.sln /p:Configuration=Release /t:WebPublish /p:WebPublishMethod=FileSystem /p:PublishUrl=\"${PUBLISH_DIR}\""
            }
        }
        
        stage('Deploy') {
            steps {
                bat 'iisreset'
            }
        }
    }
}
