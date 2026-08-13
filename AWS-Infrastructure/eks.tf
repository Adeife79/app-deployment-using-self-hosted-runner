resource "aws_eks_cluster" "eks_cluster" {
    name = var.eks_cluster
    role_arn = aws_iam_role.eks_cluster_role.arn

    vpc_config {
        subnet_ids = [
            data.aws_subnet.subnet1.id,
            data.aws_subnet.subnet2.id
        ]
    }

    depends_on = [
        aws_iam_role_policy_attachment.eks_cluster_policy
    ]
}

# EKS Node Group
resource "aws_eks_node_group" "eks_node" {
  #  cluster_name = aws_eks_cluster.eks_cluster.name

    node_group_name = var.node_group_name

    node_role_arn = aws_iam_role.eks_node_role.arn

    subnet_ids = [
        data.aws_subnet.subnet1.id,
        data.aws_subnet.subnet2.id
    ]

    instance_types = ["t3.medium"]

    scaling_config {
        desired_size = 2
        min_size = 1
        max_size = 3
    }

    depends_on = [
        aws_iam_role_policy_attachment.node_worker_policy,
        aws_iam_role_policy_attachment.node_ecr_policy,
        aws_iam_role_policy_attachment.node_cni_policy
    ]
}