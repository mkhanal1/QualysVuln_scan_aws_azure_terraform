resource "aws_instance" "myec2_2" {
  ami                    = data.aws_ami.target_ami.id
  instance_type          = "t2.micro"
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.target-sg.id]
  depends_on             = [aws_instance.myec2]
}

module "QualysScanning" {
  source  = "matti/resource/shell"
  command = "curl -H 'X-Requested-With: Curl' -u '${var.username}:${var.password}' -X 'POST' -d \"action=launch&scan_title=My+Vulnerability+Scan&ip=${aws_instance.myec2_2.private_ip}&option_id=${var.optionprofile}&iscanner_name=${var.scannername}\" ${var.baseurl}/api/2.0/fo/scan/"
  depends = [module.QualysAddIP]
}

module "QualysAddIP" {
  source  = "matti/resource/shell"
  command = "curl -H 'X-Requested-With: Curl' -u '${var.username}:${var.password}' -X 'POST' -d \"action=add&enable_vm=1&ips=${aws_instance.myec2_2.private_ip}\" ${var.baseurl}/api/2.0/fo/asset/ip/;sleep 900"
  depends = [aws_instance.myec2_2]
}

#######################################################
# Outputs
#######################################################

output "QualysAddIp-OUTPUT" { value = module.QualysAddIP.stdout }
output "QualysScanning-STATUS" { value = module.QualysScanning.stdout }
