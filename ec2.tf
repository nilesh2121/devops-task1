# added the ec2 instance details 
resource "aws_instance" "webserver" {
    ami = "ami-0b472ef474e991a66"
    instance_type = "t2.micro"
    key_name = "mylaptop-us"
    subnet_id = data.aws_subnet.public-subnet.id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.websg.id]
    tags = {
      Name = "web-server"
    }
    # user_data = file("script/user.sh")

    #   connection {
    #   type = "ssh"
    #   host = aws_instance.webserver.private_ip
    #   user = "ubuntu"
    #   private_key = file("/home/devops/Key/.ssh/id_rsa")
    #   timeout = "4m"
    # } 

    # provisioner "file" {
    #   source = "/tmp/id_rsa.pub"
    #   destination = "/tmp/authorized_keys"
      
    # }

    # provisioner "file" {
    #   source = "/script/copy.sh"
    #   destination = "/tmp/copy.sh"
      
    # }
         

   
      
}

    





# resource "local_file" "sshcopy" {
#   content = "sshcopy"
#   filename = "/home/devops/.ssh/id_rsa.pub"
# }

  
# }





resource "aws_instance" "dbserver" {
    ami = "ami-0b472ef474e991a66"
    instance_type = "t2.micro"
    key_name = "mylaptop-us"
    subnet_id = aws_subnet.private_subnet.id
    vpc_security_group_ids = [aws_security_group.dbsg.id]
    tags = {
      Name = "db-server"
    }
    # user_data = file("script/user.sh")
    

    # connection {
    #   type = "ssh"
    #   host = aws_instance.webserver.private_ip
    #   user = "ubuntu"
    #   private_key = file("/home/devops/Key/.ssh/id_rsa")
    #   timeout = "4m"
    # } 

    # provisioner "file" {
    #   source = "/home/devops/.ssh/id_rsa.pub"
    #   destination = "/tmp/.ssh/"
      
    # }    





}


# resource "local_file" "ssh" {
#   content = "sshcopy"
#   filename = "/home/devops/.ssh/id_rsa.pub"

  
# }



# added the keypaire location - production

resource "aws_key_pair" "mylaptop-us" {
    key_name = "mylaptop-us"
    public_key = file("/home/devops/Key/.ssh/id_rsa.pub")
    
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
