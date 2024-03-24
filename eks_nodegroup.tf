resource "aws_instance" "bastion" {
  ami                         = "ami-0000456e99b2b6a9"
  key_name                    = "labkaiquebastion"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.lab-public-a.id
  vpc_security_group_ids      = [aws_security_group.allow-tls.id]

  tags = {
    Name = "Bastion"
  }
}

resource "aws_eks_node_group" "node-grp" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "lab-kaique-node-grpup"
  node_role_arn   = aws_iam_role.worker.arn
  subnet_ids      = [aws_subnet.lab-public-a, aws_subnet.lab-public-b]
  capacity_type   = "SPOT"
  disk_size       = "20"
  instance_types  = ["t2.small"]

  remote_access {
    ec2_ssh_key               = "labkaiquenodes"
    source_security_group_ids = [aws_security_group.allow-tls.id]
  }

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]

}


