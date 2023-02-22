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
         withEnv (["AWS_ACCESS_KEY_ID=${env.AWS-ACCESS_KEY_ID}","AWS_SECRET_ACCESS_KEY=${env.AWS-SECRET_ACCESS_KEY}","AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          sh 'aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/x8z8q6s2'
          sh 'docker build -t demo .'
          sh 'docker tag demo:latest public.ecr.aws/x8z8q6s2/demo:latest""$BUILD-ID""'
	  sh 'docker push public.ecr.aws/x8z8q6s2/demo:latest""$BUILD-ID""'
        }		 
      }
    }
  }
}
