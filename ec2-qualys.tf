resource "aws_instance" "myec2" {
  ami = data.aws_ami.example.id
  # ami = "ami-0fc61db8544a617ed"
  instance_type = var.instance_type
  # instance_type = var.instance_type
  key_name = "N-Virginia"
  subnet_id = var.subnet_id
  vpc_security_group_ids = [ aws_security_group.qualys-sg.id ]

  tags = {
   Name = var.scannername
 }

 provisioner "local-exec" {
   command = "curl -u ${var.username}:${var.password} -H 'X-Requested-With:Curl' -X POST -d \"action=create&echo_request=1&name=${var.scannername}\" ${var.baseurl}/api/2.0/fo/appliance/ >> file.xml"
 }
}
