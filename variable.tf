variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_SESSION_TOKEN" {}

variable "AWS_REGION" {
    default = "us-east-2"
}

variable "AMIS" {
    type = map 
    default = {
    us-east-1 = "ami-0b0ea68c435eb488d"
    us-west-1 = "ami-0454207e5367abf01"
    ap-southeast-1	= "ami-0f74c08b8b5effa56"
    us-east-2 = "ami-05803413c51f242b7"
    us-west-2 = "ami-0688ba7eeeeefe3cd"

    }
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "ssh-test"
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "ssh-test.pub"
}

variable "INSTANCE_USERNAME" {
    default = "ubuntu"
}
