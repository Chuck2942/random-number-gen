@echo off
echo ======================================
echo Stopping Minikube and Docker Desktop...
echo ======================================

:: Stop Minikube cluster
echo Stopping Minikube...
minikube stop

:: Suggest user to quit Docker Desktop manually
echo --------------------------------------
echo Please manually quit Docker Desktop:
echo Right-click the whale icon in the system tray and click "Quit Docker Desktop"
echo --------------------------------------

pause