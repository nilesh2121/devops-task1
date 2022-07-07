# added the ec2 instance details 
resource "aws_instance" "webserver" {
    ami = "ami-08d4ac5b634553e16"
    instance_type = "t2.micro"
    key_name = "mylaptop-us"
    subnet_id = data.aws_subnet.public-subnet.id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.websg.id]
    tags = {
      Name = "web-server"
    }

   
    # provisioner "file" {
    #   source = "~/.ssh/."
    #   destination = "/tmp/"
    
    # }

    # connection {
    #   type = "ssh"
    #   host = self.public_ip
    #   user = "ubuntu"
    #   private_key = file("~/.ssh/id_rsa")
    #   timeout = "4m"
    # }

     user_data = file("/script/user.sh")

  
     

  # provisioner "remote-exec" {
  #   inline = [
  #       "sudo adduser --disabled-password --gecos '' devops",
  #       "sudo mkdir -p /home/devops/.ssh",
  #       "sudo touch /home/devops/.ssh/authorized_keys",
  #       "sudo echo '${var.keypath}' > authorized_keys",
  #       "sudo mv authorized_keys /home/devops/.ssh",
  #       "sudo chown -R devops:devops /home/devops/.ssh",
  #       "sudo chmod 700 /home/devops/.ssh",
  #       "sudo chmod 600 /home/devops/.ssh/authorized_keys",
  #       "sudo usermod -aG sudo devops"

  #  ]

  #   connection {
  #    user     = "ubuntu"
  #    host     = self.public_ip
  #   }

  # }    


}



resource "aws_instance" "dbserver" {
    ami = "ami-08d4ac5b634553e16"
    instance_type = "t2.micro"
    key_name = "mylaptop-us"
    subnet_id = aws_subnet.private_subnet.id
    vpc_security_group_ids = [aws_security_group.dbsg.id]
    tags = {
      Name = "db-server"
    }

    user_data = file("/script/user.sh")

#   provisioner "remote-exec" {
#     inline = [
#         "sudo adduser --disabled-password --gecos '' devops",
#         "sudo mkdir -p /home/devops/.ssh",
#         "sudo touch /home/devops/.ssh/authorized_keys",
#         "sudo echo '${var.keypath}' > authorized_keys",
#         "sudo mv authorized_keys /home/devops/.ssh",
#         "sudo chown -R devops:devops /home/devops/.ssh",
#         "sudo chmod 700 /home/devops/.ssh",
#         "sudo chmod 600 /home/devops/.ssh/authorized_keys",
#         "sudo usermod -aG sudo devops"
        
#    ]

#     connection {
#      type         = "ssh"
#      user         = "ubuntu"
#      host         = self.private_ip
#      private_key  = file("~/.ssh/id_rsa")
#      agent        = false
#      timeout      = "4m"
 
#     }

#   }     


}




# added the keypaire location - production

resource "aws_key_pair" "mylaptop-us" {
    key_name = "mylaptop-us"
    public_key = file("/home/devops/key/.ssh/id_rsa.pub")
}


# added the keypaire location -- staging 

# resource "aws_key_pair" "mylaptop-us" {
#     key_name = "mylaptop-us"
#     public_key = file("~/.ssh/id_rsa.pub")
# }



























# Method two for

# resource "aws_key_pair" "keypair" {
#     key_name = "keypair"
#     public_key = tls_private_key.rsa.public_key_openssh

# }

# resource "tls_private_key" "rsa" {
#   algorithm = "RSA"
#   rsa_bits = 4096
  
# }

# resource "local_file" "keypair" {
#   content = tls_private_key.rsa.private_key_pem
#   filename = "tfkey"
  
# }
