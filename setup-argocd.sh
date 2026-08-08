#!/bin/bash

set -e

NAMESPACE="argocd"

echo "======================================"
echo "      Setting up Argo CD"
echo "======================================"

echo "[1/5] Creating Argo CD namespace..."
kubectl create namespace $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -

echo "[2/5] Installing Argo CD..."
kubectl apply -n $NAMESPACE \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "[3/5] Waiting for Argo CD server..."
kubectl wait \
  --namespace $NAMESPACE \
  --for=condition=Available \
  deployment/argocd-server \
  --timeout=300s

echo "[4/5] Getting Argo CD admin password..."

PASSWORD=$(kubectl -n $NAMESPACE get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d)

echo ""
echo "======================================"
echo "       Argo CD Login Details"
echo "======================================"
echo "Username : admin"
echo "Password : $PASSWORD"
echo "======================================"
echo ""

echo "[5/5] Starting Argo CD dashboard..."
echo ""
echo "Dashboard URL:"
echo "https://localhost:8081"
echo ""
echo "Press Ctrl+C to stop."
echo ""

kubectl port-forward svc/argocd-server -n $NAMESPACE 8081:80 --address=0.0.0.0
