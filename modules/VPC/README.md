VPC module inputs

|         Name         |   Description   |  Type  | Default         |
| :-------------------:|:---------------:|:------:|:---------------:|             
| vpc_id               | Name of VPC            | string |     "eks-vpc"   |
| vpc_tag               | VPC tag            | string |     "eks-vpc"   |
| vpc_cidr_block       | Vpc cidr block         | string | "172.16.0.0/16" |
| subs_cidr_blocks     | Subnets cidr Block     | list(string) | ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24", "172.16.4.0/24", "172.16.5.0/24", "172.16.6.0/24"] |
| subnet-name          | Subnets name           | list(string) | ["private_subnet-1", "private_subnet-2", "private_subnet-3", "public_subnet-1", "public_subnet-2", "public_subnet-3"]   |
| azs                  | Availability-zones     | list(string) | ["us-east-1a", "us-east-1b", "us-east-1c"] | 
| igw_cidr_block       | Internet gate-way cidr block | string |  "0.0.0.0/0" | 
| rt_public_tag             | Route table (inbound all traffic) tag            | string |     "eks-rt_public"   |
| rt_nat_tag       | Route table assaciated with nat_gw tag | string |  "eks-rt_nat" |

VPC module outputs

|         Name         |   Description   |
| :-------------------:|:---------------:|   
| vpc_id               | Name of VPC     |
| subnet_name          | Name of Subnet    |
| public_subnet_for_eks_ec2               | Name of Subnet where ec2's will be deployed     |
| nat_gateway_for_public_sub              | Name of Subnet where Nat-GW will be deployed    |
| private_sub_0               | Name of the Private Subnet 1     |
| private_sub_1               | Name of the Private Subnet 2     |
| private_sub_2               | Name of the Private Subnet 3     |
| public_sub_3               | Name of the Public Subnet 1     |
| public_sub_4               | Name of the Public Subnet 2     |
| public_sub_5               | Name of the Public Subnet 3     |