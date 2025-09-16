## 🐳 Kubernetes Demo API

This project demonstrates how to containerize an API with Docker and deploy it to a Kubernetes cluster.

---

A **pod** is the smallest and most basic deployable unit in **Kubernetes**. Think of it as a small, logical group of one or more containers that share resources like a network namespace and storage volumes. While a pod can contain multiple containers, they are typically used for a single application or a tightly coupled group of processes that must run together. The main purpose of a pod is to provide a single, unified environment for an application, allowing Kubernetes to manage and scale it as a single unit, which simplifies deployment and service discovery. If a pod crashes, other healthy pods in the same service automatically take over to ensure the application remains available to users. This self-healing capability is a key feature of Kubernetes, providing high availability.

---

## ⚙️ Build and Push Docker Image

```bash
# Tag the local image
docker tag kubernetes-demo-api:latest visitha2001/kubernetes-demo-api:latest

# Push the image to Docker Hub
docker push visitha2001/kubernetes-demo-api
```

---

## ☸️ Kubernetes Cluster Info

Before deploying, make sure your Kubernetes cluster is running and connected.

```bash
# View all nodes in the cluster
kubectl get nodes

# View cluster information
kubectl cluster-info
```

---

## 🚀 Deploy to Kubernetes

Apply your deployment and service manifests.

```bash
# Apply deployment configuration
kubectl apply -f k8s/deployment.yaml

# Apply service configuration
kubectl apply -f k8s/service.yaml

# Or apply everything inside the k8s/ folder at once
kubectl apply -f k8s/
```

---

## 📦 Folder Structure

```
k8s/
  ├── deployment.yaml
  └── service.yaml
```

---

## ✅ Verify Deployment

```bash
# Check running pods
kubectl get pods -w

# Check running services
kubectl get services
```

---

## 🌐 Access the Service in Minikube
# Expose your service using minikube tunnel

```bash
minikube service devops-kubernetes-api-service
```

## 🛠 Troubleshooting

If Pods are stuck in CrashLoopBackOff or ContainerCreating:

```bash
# Delete all pods and redeploy
kubectl delete pods --all
kubectl apply -f k8s/
```

# Describe a specific pod to see detailed logs/events

```bash
kubectl describe pod <pod-name>
```

# See live container logs
```bash
kubectl logs -f <pod-name>
```

# using a bash script we can deploy the application(auto deploy)
⭐ use git bash on windows

```bash
npm run deploy
```
then run the following command to access the service
```bash
minikube service <service-name>
```