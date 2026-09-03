#bastion host

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public_a.id

  vpc_security_group_ids = [
    aws_security_group.bastion.id
  ]

  key_name = aws_key_pair.main.key_name

  associate_public_ip_address = true

  iam_instance_profile = aws_iam_instance_profile.ec2.name

  tags = {
    Name = "bastion"
  }
}
# EC2-app-a

resource "aws_instance" "app_a" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.private_a.id

  vpc_security_group_ids = [
    aws_security_group.ec2.id
  ]

  key_name = aws_key_pair.main.key_name

  iam_instance_profile = aws_iam_instance_profile.ec2.name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              echo "Hello from App Server A" > /var/www/html/index.html
              EOF

  tags = {
    Name = "app-a"
  }
}

# EC2 app-b

resource "aws_instance" "app_b" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.private_b.id

  vpc_security_group_ids = [
    aws_security_group.ec2.id
  ]

  key_name = aws_key_pair.main.key_name

  iam_instance_profile = aws_iam_instance_profile.ec2.name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              echo "Hello from App Server B" > /var/www/html/index.html
              EOF

  tags = {
    Name = "app-b"
  }
}
