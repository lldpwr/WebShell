pipeline {
  /*environment {
    registry = 'docker_hub_account/repository_name'
    registryCredential = 'dockerhub'
    dockerImage = ''
  }*/
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/lldpwr/WebShell.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + “:$BUILD_NUMBER”
        }
      }
    }
    /*stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }*/
  }
}
