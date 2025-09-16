set -e

NAME="kubernetes-demo-api"
USERNAME="visitha2001"
TAG="latest"
IMAGE="$USERNAME/$NAME:$TAG"

echo "Building docker image..... : $IMAGE"
docker build -t $IMAGE .

echo "Pushing docker image..... : $IMAGE"
docker push $IMAGE

echo "applying k8s manifest..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Get k8s pods status..."
kubectl get pods

echo "Get k8s service status..."
kubectl get services

echo "Fetching the main service..."
kubectl get services $NAME-service