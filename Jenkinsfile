pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from your version control system
                // For example, if using Git:
                git branch: 'main',
                    url: 'https://github.com/iheb79/TrainProject.git'
            }
        }
    
    
   
        
        stage('Build') {
            steps {
                // Build your project
                // Replace the build command with the appropriate build tool and commands for your project
                sh 'mvn clean install'  // Example for Maven-based projects
                // sh 'npm install'    // Example for Node.js projects
                // sh 'make'           // Example for Makefile-based projects
                // ...
            }
        }
        
        stage('SonarQube Analysis') {
    steps {
        withSonarQubeEnv('SonarQube') {
            sh 'mvn sonar:sonar -Dsonar.login=fd91f248441531260e3ae15531a57bfd418b2b0d'
        }
    }
}
        
        
    }
      
}
