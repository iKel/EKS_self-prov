# EKS Cluster with self-managed node group  
<div align="center">
<img src="https://github.com/iKel/CI-CD/assets/3269728/87ce2757-b115-4269-b362-331628671a0b" align="center" height="300" width="1010" />
</div>  
  
## 🚀 Getting Started  
  

This README is for the EKS Cluster k8s version 1.26 
  
  

## 🔢 Requirements  
  

- Terraform version ~> 1.5.0 
- AWS CLI
- Kubectl binary   
  

## 🥙 Providers  
  

- AWS 
- Kubernets
- Helm   
    

## 🏗️ Building the Cluster  
  

This repo contains EKS Cluster with self-managed AutoScalingGroup deployed on AWS. It consists of 2 modules and extra configuration files:
1. VPC. Here basic VPC, subnets, and routing are defined. 
2. EKS. This module deploys the EKS cluster, cluster Add-ons, EKS IAM Role, EKS SecurityGroup with rules needed, AutoScalingGroup with defined specs(instance profile, launch template), IAM Role for ASG
3. Configuration file aws-auth.tf. This file provides dynamic role provisioning while aws-auth config map is being created. Here k8s provider is defined as well as the timer null_resource to allow EKS cluster to be created first for configmap to be able to write into k8s cluster.
4. Configuration file ingress-controller.tf This file creates a Helm chart for the nginx ingress-controller. Helm provider is defined here as well. 

Things to consider before creating a cluster:
- EKS by default creates SecurityGroup named eks-cluster-sg-* that has restrictive inbound rule. In order to bypass it create aws_security_group_rule resource with security_group_id = aws_eks_cluster.name.vpc_config[0].cluster_security_group_id configuration allowing your inbound traffic access.
- In order for self-managed AutoScalingGroup to have permission to connect to the provisioned cluster proper IAM Role must be attached. Also, the aws-auth config map must be defined. Please refer to the <a href="https://catalog.us-east-1.prod.workshops.aws/workshops/165b0729-2791-4452-8920-53b734419050/en-US/2-identity-and-access-management/iam-groups-roles-to-manage-eks-access/configure-aws-auth-configmap">Link</a> for more information.
- EKS cluster has add-ons to be installed in order to allow nodes from AutoScalingGroup to connect to EKS. Vpc-cni and kube-proxy can be installed together with EKS cluster. Aws-ebs-csi-driver and core-dns must be installed only after a successful node connection to the cluster. <a href="https://docs.aws.amazon.com/eks/latest/userguide/eks-add-ons.html">For more information</a>. The timeouts, depends_on function, or a null_resource can be used here.
- Proper policies should be attached to the EKS IAM role and worker-node IAM role. Please address /modules/EKS/main.tf
- Proper node labeling is required for nodes to connect to the cluster. {Key = "kubernetes.io/cluster/312-eks" value = "owned"}
- Choose the correct AMI. That has k8s pre-configured. Or provision the script yourself. <a href="https://github.com/awslabs/amazon-eks-ami/blob/master/files/bootstrap.sh">Bootstrap.sh</a>
- UserData needs to be configured the way that it auto-connects the node to the cluster. Please address /modules/EKS/main.tf
- Once nginx ingress-controller is installed. Ingress webhook needs to be deleted: kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
  

## Each module has a readme file where inputs and outputs are defined.
