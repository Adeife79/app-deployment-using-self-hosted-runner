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
