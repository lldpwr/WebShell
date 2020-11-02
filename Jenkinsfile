pipeline {
  environment {
    registry = 'lldpwr/webshell'
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git branch: 'main', url: 'https://github.com/lldpwr/WebShell.git'
      }
    }
    stage('test') {
      steps{
        script {
          pwsh "cd /usr/src/app; ./launch.ps1"
        }
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}


// correct branch for main in pipeline from scm
// add docker plugin
