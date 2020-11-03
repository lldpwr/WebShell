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
    stage('install') {
      steps{
        script {
          pwsh returnStatus:true  ,script:'Install-Module -Name Pode -Confirm:$false -force'
        }
      }
    }
    stage('test') {
      steps{
        script {
          pwsh returnStatus:true  ,script:"cd site; ./test.ps1"
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
