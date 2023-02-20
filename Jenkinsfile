pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
	 sh 'printenv'
       	   
       }
     }  
     stage ('Publish ECR') {
       steps {
         withEnv (["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}","AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}","AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          sh 'docker login --username AWS --password $(aws ecr-public get-login-password --region us-east-1) public.ecr.aws/x8z8q6s2'
          sh 'docker build -t demo .'
          sh 'docker tag demo:latest public.ecr.aws/x8z8q6s2/demo:latest""$BUILD-ID""'
	  sh 'docker push public.ecr.aws/x8z8q6s2/demo:latest""$BUILD-ID""'
        }		 
      }
    }
  }
}
