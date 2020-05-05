module "QualysVirtualScanner" {
  source  = "matti/resource/shell"
  command = "curl -u '${var.username}:${var.password}' -H 'X-Requested-With:Curl' -X 'POST' -d \"action=create&echo_request=1&name=${var.scannername}\" ${var.baseurl}/api/2.0/fo/appliance/ | grep \"<ACTIVATION_CODE>\" | awk -F\">\" '{print $2}' | awk -F\"<\" '{print $1}'"
}

resource "aws_instance" "myec2" {
  ami = data.aws_ami.example.id
  instance_type = var.instance_type
  key_name               = "mikesh-tokyo"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.qualys-sg.id]
  user_data              = format("PERSCODE=%s",module.QualysVirtualScanner.stdout)

  tags = {
    Name = var.scannername
  }
  depends_on = [module.QualysVirtualScanner]
}
#######################################################
# Outputs
#######################################################

output "CLOUDVIEW-OUTPUT" { value = module.QualysVirtualScanner.stdout }
