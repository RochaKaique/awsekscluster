resource "aws_eks_cluster" "cluster" {
  name     = "kaiquelab-cluster"
  role_arn = aws_iam_role.role_eks.arn

  vpc_config {
    subnet_ids = [aws_subnet.lab-public-a.id, aws_subnet.lab-public-b.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController
  ]
}