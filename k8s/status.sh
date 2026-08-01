#!/bin/bash

set -e

NAMESPACE="jerney"

echo "===================================================="
echo "        Jerney Kubernetes Cluster Status"
echo "===================================================="

echo ""
echo "Current Context"
echo "----------------------------------------------------"
kubectl config current-context

echo ""
echo "Cluster Information"
echo "----------------------------------------------------"
kubectl cluster-info

echo ""
echo "Nodes"
echo "----------------------------------------------------"
kubectl get nodes -o wide

echo ""
echo "Namespace"
echo "----------------------------------------------------"
kubectl get namespace $NAMESPACE

echo ""
echo "Deployments"
echo "----------------------------------------------------"
kubectl get deployments -n $NAMESPACE

echo ""
echo "ReplicaSets"
echo "----------------------------------------------------"
kubectl get replicasets -n $NAMESPACE

echo ""
echo "Pods"
echo "----------------------------------------------------"
kubectl get pods -n $NAMESPACE -o wide

echo ""
echo "Services"
echo "----------------------------------------------------"
kubectl get svc -n $NAMESPACE

echo ""
echo "Persistent Volume Claims"
echo "----------------------------------------------------"
kubectl get pvc -n $NAMESPACE

echo ""
echo "Persistent Volumes"
echo "----------------------------------------------------"
kubectl get pv

echo ""
echo "Storage Classes"
echo "----------------------------------------------------"
kubectl get storageclass

echo ""
echo "ConfigMaps"
echo "----------------------------------------------------"
kubectl get configmap -n $NAMESPACE

echo ""
echo "Secrets"
echo "----------------------------------------------------"
kubectl get secret -n $NAMESPACE

echo ""
echo "Network Policies"
echo "----------------------------------------------------"
kubectl get networkpolicy -n $NAMESPACE

echo ""
echo "Events (Latest First)"
echo "----------------------------------------------------"
kubectl get events -n $NAMESPACE --sort-by=.metadata.creationTimestamp

echo ""
echo "===================================================="
echo "Status Check Completed"
echo "===================================================="
