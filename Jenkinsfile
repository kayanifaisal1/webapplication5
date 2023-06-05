pipeline {
    agent any
    
    stages {
        stage('Source') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'file:///C:/Users/faisal.kayani/Desktop/New folder (4)/webapplication5']]])
            }
        }
        
        stage('Build') {
            steps {
                bat "\"${tool 'MSBuild'}\" my_app.sln /p:Configuration=Release /t:build"
            }
        }
        
        stage('Publish') {
            steps {
                bat "\"${tool 'MSBuild'}\" my_app.sln /p:Configuration=Release /t:WebPublish /p:WebPublishMethod=FileSystem /p:PublishUrl=C:\\inetpub\\wwwroot"
            }
        }
        
        stage('Deploy') {
            steps {
                bat 'iisreset'
            }
        }
    }
}
