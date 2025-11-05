pipeline {
   
   agent any
   
tools {
  maven 'maven__01'
  jdk 'JDK_home'
}


stages{
    
    stage('Check out the repository'){
        steps{
checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/DhineshDine/maven-tomcat-devops1.git']])
echo "checked out from the git hub "
        }
    }
    
    stage('Build The Project'){
        steps{
            bat 'mvn clean install'
            
            echo 'Build Successfully'
        }
    }
    
    stage('testing the project '){
        steps{
        
            bat 'mvn test'
        echo "tested successfully"
            
        }
        
    }
    
    stage('Deploy the project to Docker'){
        
        steps{
            withCredentials([string(credentialsId: 'docker-pwd', variable: 'DOCKER')]) {
    bat "docker login -u dhineshdine -p ${DOCKER}"
    
    echo "logged in "
    bat 'docker build -t dhineshdine/maven-tomcat-project1:latest .'
    bat 'docker push dhineshdine/maven-tomcat-project1:latest'
    
    

    echo "Deployed successfully"
}
        }
    }
    
  
}
    
}
