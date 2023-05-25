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
        stage('Docker Build') {
            steps {
                // Build the Docker image and include the JAR
                script {
                    docker.build('TrainProject:tag') {
                        // Copy the JAR file into the Docker image
                        sh 'cp target/ExamThourayaS2.jar .'
                    }
                }
            }
        }

        stage('Docker Push') {
            steps {
                // Push the Docker image to a Docker registry (e.g., Docker Hub)
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image('TrainProject').push()
                    }
                }
            }
        }
        
        
    }
      
}
