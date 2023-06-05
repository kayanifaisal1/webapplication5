pipeline {
    agent any

    stages {
        stage('Source') {
            steps {
                // Checkout the code from your Git repository
                git 'https://github.com/kayanifaisal1/webapplication5.git'
            }
        }

        stage('Build') {
            steps {
                // Build your .NET project using MSBuild
                bat "\"${tool 'MSBuild'}\" your_project.sln /p:Configuration=Release /t:build"
            }
        }

        stage('Publish') {
            steps {
                // Publish the website to a directory
                bat "\"${tool 'MSBuild'}\" your_project.sln /p:Configuration=Release /t:WebPublish /p:WebPublishMethod=FileSystem /p:PublishUrl=C:\\inetpub\\wwwroot"
            }
        }

        stage('Deploy') {
            steps {
                // Restart IIS to deploy the updated website
                bat 'iisreset'
            }
        }
    }
}
