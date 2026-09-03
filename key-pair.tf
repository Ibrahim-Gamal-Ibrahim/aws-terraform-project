resource "aws_key_pair" "main" {
  key_name   = "terra-key"
  public_key = file("~/.ssh/terra-devops.pub") #you should create it locally with the name you want and replace it here as we use the import method to add a key in aws

  tags = {
    Name = "terra-key"
  }
}