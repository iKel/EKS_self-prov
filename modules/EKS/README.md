EKS module inputs

|         Name         |   Description   |  Type  | Default         |
| :-------------------:|:---------------:|:------:|:---------------:|             
| vpc_id               | Name of VPC            | string |     Value is taken from VPC module   |
| eks_name       | EKS cluster name          | string | "312-eks" |
| key_name       | SSH key-pair          | string | "key" |
| vers     | EKS cluster version     | string | "1.26" |
| subnets          | Subnets name           | list(string) | Value is taken from VPC module |
| logs                  | EKS cluster logging configuration     | list(string) | [ "api", "audit", "authenticator", "controllerManager", "scheduler" ] | 
| node_labels       | Node labels | map |  none | 
| addons       | Add-ons for EKS cluster | list(string) |  [ "vpc-cni", "kube-proxy", "coredns", "aws-ebs-csi-driver" ] |

EKS module outputs

|         Name         |   Description   |
| :-------------------:|:---------------:|   
| arn                   | Arn of AutoScalingGroup IAM role    |
| eks_cluster               | EKS cluster reference     |
| cluster-name          | EKS cluster name    |
| cluster-endpoint      | EKS cluster endpoint     |
| cluster_security_group_id | EKS cluster default security group id   |
| autoscaling_group               | AutoScalingGroup reference     |

Useful command to label worker nodes:
kubectl label node <node_name> node-role.kubernetes.io/worker=worke
