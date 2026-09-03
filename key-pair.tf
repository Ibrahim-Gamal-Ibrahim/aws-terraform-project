resource "aws_key_pair" "main" {
  key_name   = "terra-key"
  public_key = file("~/.ssh/terra-devops.pub")

  tags = {
    Name = "terra-key"
  }
}