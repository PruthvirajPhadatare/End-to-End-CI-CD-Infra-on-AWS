pipeline {
  agent any

  environment {
    AWS_REGION   = 'ap-south-1'
    ECR_REPO     = credentials('ecr-url')
    CLUSTER_NAME = 'cicd-cluster'
    GREEN_SVC    = 'cicd-green'
    LISTENER_ARN = credentials('alb-listener-arn')
    GREEN_TG_ARN = credentials('green-tg-arn')
  }

  stages {

    stage('Checkout Code') {
      steps {
        git 'https://github.com/yourusername/end-to-end-cicd-aws.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t cicd-app app/'
      }
    }

    stage('Push Image to ECR') {
      steps {
        sh '''
        aws ecr get-login-password --region $AWS_REGION | \
        docker login --username AWS --password-stdin $ECR_REPO

        docker tag cicd-app:latest $ECR_REPO:latest
        docker push $ECR_REPO:latest
        '''
      }
    }

    stage('Deploy to GREEN Environment') {
      steps {
        sh '''
        aws ecs update-service \
          --cluster $CLUSTER_NAME \
          --service $GREEN_SVC \
          --force-new-deployment \
          --desired-count 2
        '''
      }
    }

    stage('Wait for GREEN Stability') {
      steps {
        sleep 60
      }
    }

    stage('Switch Traffic BLUE → GREEN') {
      steps {
        sh '''
        aws elbv2 modify-listener \
          --listener-arn $LISTENER_ARN \
          --default-actions Type=forward,TargetGroupArn=$GREEN_TG_ARN
        '''
      }
    }
  }

  post {
    success {
      echo "✅ Blue-Green deployment successful. Traffic switched to GREEN."
    }
    failure {
      echo "❌ Deployment failed. BLUE environment remains active."
    }
  }
}
