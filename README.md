This project is a simple Flask-based web application that generates random numbers through a user-friendly interface. The app is containerized using Docker and deployed to a local Kubernetes cluster using Minikube. A GitHub Actions CI/CD pipeline automatically builds and pushes the Docker image to Docker Hub on every push to the main branch. While deployment to Kubernetes is handled manually due to Minikube's local scope, the project demonstrates core DevOps principles including containerization, orchestration, and continuous integration.



To start up project: USE BAT FILE or manually
Start docker desktop
minikube start --driver=docker
kubectl get pods
kubectl get services
kubectl rollout restart deployment random-api-deployment
minikube service random-api-service

To stop project: USE BAT FILE or manually
minikube stop
Quit docker desktop in system tray

Make sure the following tools are installed:
• Git
• Python 3.9+
• Docker Desktop with account
• Minikube
• kubectl
• A Docker Hub account and a GitHub account

Step 1: Clone the GitHub Repo
git clone https://github.com/Chuck2942/random-number-gen.git

Step 2: Run the App Locally (Optional)
pip install -r requirements.txt
python app.py
Visit http://localhost:5000 in your browser.

Step 3: Build and Run the App in Docker (run all commands at the project root in cmd prompt)
docker build -t random-api .
docker run -p 5000:5000 random-api
Then go to: http://localhost:5000

Step 4: Push Docker Image to Docker Hub
docker login
docker tag random-api <your-dockerhub-username>/random-api:latest
docker push <your-dockerhub-username>/random-api:latest
Replace <your-dockerhub-username> with your Docker Hub username.

Step 5: Deploy to Kubernetes (Minikube)
minikube start --driver=docker
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
minikube service random-api-service
This will open your app in a browser via NodePort (e.g., http://127.0.0.1:30007).

Step 6: Update Deployment After Pushing Changes
kubectl rollout restart deployment random-api-deployment
This pulls the latest Docker image from Docker Hub and restarts the app in Kubernetes.

Enable GitHub Actions CI/CD
1. Go to your GitHub repo: Settings > Secrets and variables > Actions
2. Add the following repository secrets:
    DOCKER_USERNAME Your Docker Hub username
    DOCKER_PASSWORD Your Docker Hub password or access token
    KUBECONFIG Contents of your %USERPROFILE%\.kube\config file, get this by running
    the command “type %USERPROFILE%\.kube\config”

Ensure your .github/workflows/ci-cd.yml contains a pipeline that:
• Builds the Docker image
• Pushes it to Docker Hub