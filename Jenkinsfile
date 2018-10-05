pipeline {
  agent any

  tools {
    maven 'mvn-3.5.4'
  }

  stages {
           stage ('Prepare') {
            steps {
                checkout([$class: 'GitSCM',
                    branches: [[name: "origin/master"]],
                    doGenerateSubmoduleConfigurations: false,
                    extensions: [[$class: 'LocalBranch']],
                    submoduleCfg: [],
                    userRemoteConfigs: [[
                        credentialsId: 'naresh493',
                        url: 'https://github.com/naresh493/hello-world-war.git']]])
            }
        }
  
    stage('Maven Build') {
      steps {
        sh 'mvn package'
      }
    }
    
    stage('Docker Build') {
      steps {
      sh "docker build -t caprearch/helloworld-war:${env.BUILD_ID} ."
      sh "docker tag caprearch/helloworld-war:${env.BUILD_ID} caprearch/helloworld-war:latest"
	  
      }
    }
	
	stage('Docker Deployment') {
	steps {
    //    stage('Parallel Stage') {
    //        failFast true
    //        parallel {
    //            stage('Remove continer') {
     //               agent {
     //                   label "helloworld"
     //               }
      //              steps {
      //                  echo "On Branch A"
      //              }
       //         }
       //         stage('Create continer') {
         //           agent {
       //                 label "helloworld"
       //             }
        //            steps {
        //                echo "On Branch B"
        //            }
        //        }
        //    }
       // } 
	  sh "docker service ls"
	  sh "docker service rm helloworld-war"
	  sh "docker service create --name helloworld-war --replicas 1 --publish 5000:8080 caprearch/helloworld-war:${env.BUILD_ID}"
	  sh "docker service ls"
	  		
		} 
    }
	
	stage("Docker publish") {
      steps {
       // withCredentials([usernamePassword(
       //   usernameVariable: "caprearch",
       //   passwordVariable: "caprearch")]) 
          sh "docker login -u 'caprearch' -p 'caprearch'"
		  sh "docker push caprearch/helloworld-war:${env.BUILD_ID}"
       
      }
    }
	
	// stage('Push image') {
  //    docker.withRegistry('http://10.108.195.171:1111/nexus/repository/dockerimg/', 'nexus') {
  //      container.push("${shortCommit}")
  //      container.push('latest')
  //   }
  //  }
	
   } 
  }
  
  
  
  
/////feature/////
  
  
  //  stage('Check Specification') {
  //    steps {
   //     sh "chmod o+w *"
   //     sh "docker-compose up --exit-code-from cucumber --build"
   //   }
   // }
 // }

 // post {
 //   always {
 //     archive 'target/**/*.jar'
 //     junit 'target/**/*.xml'
 //     cucumber '**/*.json'
 //   }
 // }
//}
  //  success {
  //    withCredentials([usernamePassword(credentialsId: 'docker-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
  //      sh "docker login -u ${USERNAME} -p ${PASSWORD}"
  //      sh "docker push naresh/helloworld-war:${env.BUILD_ID}"
  //      sh "docker push naresh/helloworld-war:latest"
  //    }
   // }
 // }
//}
