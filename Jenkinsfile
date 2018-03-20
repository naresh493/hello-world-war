pipeline {
  agent any

  tools {
    maven 'mvn-3.5.2'
  }

  stages {
    stage('Build') {
      steps {
        sh 'mvn package'
      }
    }
    
    stage('Make Container') {
      steps {
      sh "docker build -t naresh/helloworld-war:${env.BUILD_ID} ."
      sh "docker tag naresh/helloworld-war:${env.BUILD_ID} naresh/helloworld-war:latest"
      }
    }
    
  //  stage('Check Specification') {
  //    steps {
   //     sh "chmod o+w *"
   //     sh "docker-compose up --exit-code-from cucumber --build"
   //   }
   // }
  }

  post {
    always {
      archive 'target/**/*.jar'
      junit 'target/**/*.xml'
      cucumber '**/*.json'
    }
  }
}
  //  success {
  //    withCredentials([usernamePassword(credentialsId: 'docker-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
  //      sh "docker login -u ${USERNAME} -p ${PASSWORD}"
  //      sh "docker push naresh/helloworld-war:${env.BUILD_ID}"
  //      sh "docker push naresh/helloworld-war:latest"
  //    }
   // }
 // }
//}