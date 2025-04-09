@echo off
echo Starting Docker Desktop...
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
timeout /t 10
echo Starting Minikube...
minikube start --driver=docker
pause