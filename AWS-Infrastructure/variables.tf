variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_cidr_block1" {
  description = "CIDR block for Public Subnet1"
  type        = string
}

variable "public_cidr_block2" {
  description = "CIDR block for Public Subnet2"
  type        = string
}

variable "private_cidr_block1" {
  description = "CIDR block for Private Subnet1"
  type        = string
}

variable "private_cidr_block2" {
  description = "CIDR block for Private Subnet2"
  type        = string
}


variable "project_name" {
  description = "Project name"
  type        = string
}


variable "eks_cluster_role" {
    type = string
    description = "EKS Clsuter Role Name"
}

variable "eks_node_role" {
    type = string
    description = "EKS Node Role Name"
}

variable "eks_cluster" {
    type = string
    description = "EKS Cluster Name"
}

variable "node_group_name" {
    type = string
    description = "EKS Node Group Name"
}

variable "repository_name" {
    type = string
    description = "ECR Repository Name"
}
