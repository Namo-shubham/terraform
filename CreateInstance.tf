resource "aws_key_pair" "ssh-test" {
    key_name = "ssh-test"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "MyFirstInstance" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    count = "3"
    key_name = "aws_key_pair.ssh-test.key_name"
    
    tags = {
        Name = "demoInstance-${count.index}"
    }
    


    provisioner "file" {
        source = "installNginx.sh"
        destination = "/tmp/installNginx.sh"
    }

    provisioner "remote-exec" {
        inline = [

            "sudo chmod +x /tmp/installNginx.sh",
            "sudo /tmp/installNginx.sh"
        ]
    }

    connection {
        host = coalesce(self.public_ip, self.private_ip)
        type = "ssh"
        user = "var.INSTANCE_USERNAME"
        private_key = "file(var.PATH_TO_PRIVATE_KEY)"
    }
}


