pipeline {
    agent any

    stages {
        stage('Prepare') {
            steps {
                script {
                    // Create a temporary copy of the local repository
                    bat "xcopy /E /I /Y \"C:\\Users\\faisal.kayani\\Desktop\\New folder (4)\\webapplication5\" \"C:\\Temp\\webapplication5\""
                }
            }
        }

        stage('Source') {
            steps {
                // Checkout the code from the temporary repository copy
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'file:///C:/Temp/webapplication5']]])
            }
        }

        stage('Build') {
            steps {
                // Build the .NET project
                bat "\"${tool 'MSBuild'}\" my_app.sln /p:Configuration=Release /t:build"
            }
        }

        stage('Publish') {
            steps {
                // Publish the website to a directory
                bat "\"${tool 'MSBuild'}\" my_app.sln /p:Configuration=Release /t:WebPublish /p:WebPublishMethod=FileSystem /p:PublishUrl=C:\\inetpub\\wwwroot"
            }
        }

        stage('Deploy') {
            steps {
                // Restart IIS to deploy the updated website
                bat 'iisreset'
            }
        }
    }

    post {
        always {
            // Clean up the temporary repository copy
            bat 'rd /S /Q "C:\\Temp\\webapplication5"'
        }
    }
}
