#!/bin/bash

set -e

NAMESPACE="jerney"

echo "========================================"
echo " Starting Jerney Kubernetes Deployment"
echo "========================================"

#-----------------------------------------
# Namespace
#-----------------------------------------
echo ""
echo "[1/13] Creating Namespace..."
kubectl apply -f namespace.yml

#-----------------------------------------
# ConfigMap
#-----------------------------------------
echo ""
echo "[2/13] Creating ConfigMap..."
kubectl apply -f configmap.yml

#-----------------------------------------
# Secret
#-----------------------------------------
echo ""
echo "[3/13] Creating Secret..."
kubectl apply -f secret.yml

#-----------------------------------------
# StorageClass
#-----------------------------------------
echo ""
echo "[4/13] Creating StorageClass..."
kubectl apply -f storageclass.yml

#-----------------------------------------
# PVC
#-----------------------------------------
echo ""
echo "[5/13] Creating Persistent Volume Claim..."
kubectl apply -f pvc.yml

#-----------------------------------------
# PostgreSQL Deployment
#-----------------------------------------
echo ""
echo "[6/13] Deploying PostgreSQL..."
kubectl apply -f database/postgres-deployment.yml

echo ""
echo "Waiting for PVC to become Bound..."

while true
do
    STATUS=$(kubectl get pvc jerney-db-pvc -n $NAMESPACE -o jsonpath='{.status.phase}')

    if [[ "$STATUS" == "Bound" ]]; then
        echo "PVC is Bound."
        break
    fi

    echo "PVC Status: $STATUS"
    sleep 5
done

echo ""
echo "Waiting for PostgreSQL Deployment..."

kubectl rollout status deployment/jerney-db -n $NAMESPACE --timeout=300s

echo "PostgreSQL Deployment Ready."

#-----------------------------------------
# PostgreSQL Service
#-----------------------------------------
echo ""
echo "[7/13] Creating PostgreSQL Service..."
kubectl apply -f database/postgres-service.yml

#-----------------------------------------
# Backend Deployment
#-----------------------------------------
echo ""
echo "[8/13] Deploying Backend..."
kubectl apply -f backend/backend-deployment.yml

echo ""
echo "Waiting for Backend Deployment..."

kubectl rollout status deployment/jerney-backend -n $NAMESPACE --timeout=300s

echo "Backend Deployment Ready."

#-----------------------------------------
# Backend Service
#-----------------------------------------
echo ""
echo "[9/13] Creating Backend Service..."
kubectl apply -f backend/backend-service.yml

#-----------------------------------------
# Frontend Deployment
#-----------------------------------------
echo ""
echo "[10/13] Deploying Frontend..."
kubectl apply -f frontend/frontend-deployment.yml

echo ""
echo "Waiting for Frontend Deployment..."

kubectl rollout status deployment/jerney-frontend -n $NAMESPACE --timeout=300s

echo "Frontend Deployment Ready."

#-----------------------------------------
# Frontend Service
#-----------------------------------------
echo ""
echo "[11/13] Creating Frontend Service..."
kubectl apply -f frontend/frontend-service.yml

#-----------------------------------------
# Network Policies
#-----------------------------------------
echo ""
echo "[12/13] Applying Database Network Policy..."
kubectl apply -f network-policy/db-networkpolicy.yml

echo ""
echo "[13/13] Applying Backend Network Policy..."
kubectl apply -f network-policy/backend-networkpolicy.yml

echo ""
echo "========================================"
echo " Deployment Completed Successfully"
echo "========================================"

echo ""
echo "Namespaces"
kubectl get ns

echo ""
echo "Pods"
kubectl get pods -n $NAMESPACE -o wide

echo ""
echo "Deployments"
kubectl get deployments -n $NAMESPACE

echo ""
echo "Services"
kubectl get svc -n $NAMESPACE

echo ""
echo "PVC"
kubectl get pvc -n $NAMESPACE

echo ""
echo "Network Policies"
kubectl get networkpolicy -n $NAMESPACE
