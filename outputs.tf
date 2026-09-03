output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "application_url" {
  description = "HTTPS URL of the application"
  value       = "https://${var.app_subdomain}.${var.domain_name}"
}

output "bastion_public_ip" {
  description = "Public IP address of the bastion host"
  value       = aws_instance.bastion.public_ip
}

output "app_a_private_ip" {
  description = "Private IP address of application server A"
  value       = aws_instance.app_a.private_ip
}

output "app_b_private_ip" {
  description = "Private IP address of application server B"
  value       = aws_instance.app_b.private_ip
}

output "bastion_id" {
  description = "Bastion EC2 instance ID"
  value       = aws_instance.bastion.id
}

output "app_a_id" {
  description = "Application server A instance ID"
  value       = aws_instance.app_a.id
}

output "app_b_id" {
  description = "Application server B instance ID"
  value       = aws_instance.app_b.id
}