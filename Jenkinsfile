-D"hudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true"
pipeline {
    agent any

    stages {
        stage('Source') {
            steps {
                // Checkout the code from the local directory
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'file:///C:/Users/faisal.kayani/Desktop/New folder (3)']]])
            }
        }

        stage('Build') {
            steps {
                // Build the .NET project
                bat "\"${tool 'MSBuild'}\" my_app.sln /p:Configuration=Release"
            }
        }

        stage('Publish') {
            steps {
                // Publish the website to a directory
                bat "\"${tool 'MSBuild'}\" my_app.sln /p:Configuration=Release /t:WebPublish /p:PublishUrl=C:\\\\inetpub\\\\wwwroot"
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
