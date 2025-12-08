

ECR_URL=812326498925.dkr.ecr.us-east-2.amazonaws.com
REPO_URL=${ECR_URL}/churn-prediction-lambda
REMOTE_IMAGE_TAG="${ECR_URL}/churn-prediction-lambda:v1"

LOCAL_IMAGE=churn-prediction-lambda

aws ecr get-login-password \
  --region "us-east-2" \
| docker login \
  --username AWS \
  --password-stdin ${ECR_URL}

docker build -t ${LOCAL_IMAGE} .
docker tag ${LOCAL_IMAGE} ${REMOTE_IMAGE_TAG}
docker push ${REMOTE_IMAGE_TAG}

echo "Done"