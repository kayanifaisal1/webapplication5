pipeline {
    agent any
    stages {
        stage('Source') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'e71b31bd-cc1f-4189-8294-abae520699bf', url: 'https://github.com/kayanifaisal1/webapplication5.git']]])
            }
        }
        stage('Build') {
            steps {
                bat "\"${tool 'MSBuild'}\" jenkinsIIS.sln /t:build /p:Configuration=Release /p:Platform=\"Any CPU\""
            }
        }
        stage('Approval') {
            steps {
                input message: 'Deploy approval', ok: 'Deploy'
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Stop IIS service
                    bat 'net stop w3svc'
                    // Deploy the application
                    bat "\"${tool 'MSBuild'}\" jenkinsIIS.sln /p:DeployOnBuild=true /p:DeployDefaultTarget=WebPublish /p:WebPublishMethod=FileSystem /p:SkipInvalidConfigurations=true /p:DeleteExistingFiles=False /p:publishUrl=c:\\Faisalkayani\\wwwroot"
                    // Start IIS service
                    bat 'net start w3svc'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t jenkinsIIS -f Dockerfile .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container
                    sh 'docker run -d -p 8080:80 --name my-app jenkinsIIS'
                }
            }
        }
    }
}
