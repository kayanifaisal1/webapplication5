pipeline {
    agent any

    stages {
        stage('Source') {
            steps {
                // Checkout the code from your Git repository
                git 'https://github.com/kayanifaisal1/webapplication5.git'
            }
        }

        stage('Restore') {
            steps {
                // Restore NuGet packages
                bat 'dotnet restore'
            }
        }

        stage('Build') {
            steps {
                // Build your .NET project
                bat 'dotnet build --configuration Release --no-restore'
            }
        }

        stage('Publish') {
            steps {
                // Publish each project to its own directory
                bat 'dotnet publish --configuration Release --no-build'
            }
        }

        stage('Deploy') {
            steps {
                // Copy published files to the desired location
                bat 'xcopy /E /I /Y .\\**\\bin\\Release\\net6.0\\publish\\* C:\\inetpub\\wwwroot'
            }
        }

        stage('Clean') {
            steps {
                // Clean up the workspace
                bat 'dotnet clean'
            }
        }
    }
}
