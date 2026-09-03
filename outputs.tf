output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "app_a_private_ip" {
  value = aws_instance.app_a.private_ip
}

output "app_b_private_ip" {
  value = aws_instance.app_b.private_ip
}

output "bastion_id" {
  value = aws_instance.bastion.id
}

output "app_a_id" {
  value = aws_instance.app_a.id
}

output "app_b_id" {
  value = aws_instance.app_b.id
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}