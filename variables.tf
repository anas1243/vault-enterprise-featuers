variable "use_case" {
  type = string
}
variable "region" {
  type = string
}
variable "public_subnet1_zone" {
  type = string
}
variable "public_subnet2_zone" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet1_cidr" {
  type = string
}

variable "public_subnet2_cidr" {
  type = string
}

variable "env" {
  type = string
}

variable "vms_ami_us-east-1" {
  type = string
}

variable "vms_machine_type" {
  type = string
}

variable "vms_key_name" {
  type = string
}