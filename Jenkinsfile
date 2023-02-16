pipeline {
   agent any
   stages {
   stage('build') {
     steps {
	   sh 'printenv'
	   sh 'docker build -t ecr-demo .'
	   
	  }
	 }
	 stage ('Publish ECR') {
	   steps {
	     withEnv (["AWS-ACCESS_KEY_ID=$(env.AWS-ACCESS_KEY_ID)","AWS-SECRET_ACCESS_KEY=$(env.AWS-SECRET_ACCESS_KEY)","AWS_DEFAULT_REGION=$(env.AWS_DEFAULT_REGION}"]) {
		   sh 'docker login -u AWS -p $(aws ecr-public get-login-password --region us-east-1) public.ecr.aws/x8z8q6s2
		   sh 'docker build -t ecr-demo .'
		   sh 'docker tag ecr-demo:""$BUILD-ID""
		   sh 'docker push public.ecr.aws/x8z8q6s2/demo:""$BUILD-ID""'
		}
	  }
	}
  }
}	
