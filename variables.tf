variable "cidr" {
  default = "10.0.0.0/16"
  type    = string
}

variable "ami_id" {
  default = "ami-020cba7c55df1f615"
}

variable "instance_type" {
  default = "t3.micro"
}