variable "name" {
  type        = string
  description = "The name of the VPC."
}

variable "cidr" {
  type        = string
  description = "The CIDR of the VPC."
}

variable "private_az_subnets" {
  type        = map(string)
  description = "The private subnets to create on availability zones."
}

variable "public_az_subnets" {
  type        = map(string)
  description = "The public subnets to create on availability zones."
}

variable "enable_dns_hostnames" {
  description = "Should be true if you want to use private DNS within the VPC"
  default     = true
  type        = bool
}

variable "enable_dns_support" {
  description = "Should be true if you want to use private DNS within the VPC"
  default     = true
  type        = bool
}

variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  default     = true
  type        = bool
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets."
  value       = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets."
  value       = aws_subnet.private.*.id
}

output "vpc_id" {
  value = aws_vpc.webpa.id
}

output "cidr" {
  value = aws_vpc.webpa.cidr_block
}


