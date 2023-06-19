pipeline {
    agent any
    stages {
        stage('Source') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'e71b31bd-cc1f-4189-8294-abae520699bf', url: 'https://github.com/kayanifaisal1/webapplication5.git']]])
                }
            }
        }

        stage('Build') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    bat "\"${tool 'MSBuild'}\" jenkinsIIS.sln /t:build /p:Configuration=Release /p:Platform=\"Any CPU\""
                }
            }
        }

        stage('Approval') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    input message: 'Deploy approval', ok: 'Deploy'
                }
            }
        }

        stage('Deploy') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
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
        }

        stage('Docker') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'SUCCESS') {
                    script {
                        // Build Docker Image
                        dir('C:\\Users\\faisal.kayani\\Desktop\\jenk') {
                            bat 'docker build -t app .'
                        }
                        
                        // Run Docker Container
                        bat 'docker run -d -p 0000:80 app'
                    }
                }
            }
        }
    }
}