#!/bin/bash

export CLUSTER_NAME=$(aws eks list-clusters --query "clusters[0]" --output text)
aws eks --region us-east-1 update-kubeconfig --name $CLUSTER_NAME
export KUBECONFIG=~/.kube/config

kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission

for i in $(kubectl get nodes -o name); 
    do kubectl label node ${i##*/} node-role.kubernetes.io/worker=worker; 
done
