//def ReleaseDir = "c:\Faisalkayani\wwwroot"
pipeline {
			agent any
			stages {
				stage('Source'){
					steps{
						checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'e71b31bd-cc1f-4189-8294-abae520699bf', url: 'https://github.com/kayanifaisal1/webapplication5.git']]])
					}
				}
				stage('Build/Deploy') {
    					steps {
    					    bat "\"${tool 'MSBuild'}\" jenkinsIIS.sln /p:DeployOnBuild=true /p:DeployDefaultTarget=WebPublish /p:WebPublishMethod=FileSystem /p:SkipInvalidConfigurations=true /t:build /p:Configuration=Release /p:Platform=\"Any CPU\" /p:DeleteExistingFiles=True /p:publishUrl=c:\\Faisalkayani\\wwwroot"
    					}
				}
			}
}