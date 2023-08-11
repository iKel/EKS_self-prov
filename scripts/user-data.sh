#!/bin/bash
set -ex
export CLUSTER_NAME=$(aws eks list-clusters --query "clusters[0]" --output text)
export ENDPOINT=$(aws eks describe-cluster --name $CLUSTER_NAME --query "cluster.endpoint" --output text)
export CA=$(aws eks describe-cluster --name $CLUSTER_NAME --query "cluster.certificateAuthority.data" --output text)


/etc/eks/bootstrap.sh $CLUSTER_NAME \
  --b64-cluster-ca $CA\
  --apiserver-endpoint $ENDPOINT 
