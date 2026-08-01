#!/bin/bash

set -e

NAMESPACE="jerney"

echo "========================================"
echo " Starting Jerney Kubernetes Cleanup"
echo "========================================"

#-------------------------------------------------------
# Delete Namespace
#-------------------------------------------------------

if kubectl get namespace $NAMESPACE >/dev/null 2>&1
then
    echo ""
    echo "Deleting namespace '$NAMESPACE'..."

    kubectl delete namespace $NAMESPACE

    echo ""
    echo "Waiting for namespace to terminate..."

    while kubectl get namespace $NAMESPACE >/dev/null 2>&1
    do
        echo "Namespace still exists..."
        sleep 5
    done

    echo "Namespace deleted successfully."

else
    echo ""
    echo "Namespace '$NAMESPACE' does not exist."
fi

#-------------------------------------------------------
# Delete StorageClass
#-------------------------------------------------------

if kubectl get storageclass jerney-ebs-sc >/dev/null 2>&1
then
    echo ""
    echo "Deleting StorageClass..."

    kubectl delete storageclass jerney-ebs-sc

    echo "StorageClass deleted."

else
    echo ""
    echo "StorageClass not found."
fi

echo ""
echo "========================================"
echo " Cleanup Completed Successfully"
echo "========================================"

echo ""
echo "Remaining Namespaces:"
kubectl get namespaces

echo ""
echo "Remaining StorageClasses:"
kubectl get storageclass
