/*
resource "aws_instance" "myec2_2" {
   ami = "ami-0fc61db8544a617ed"
   instance_type = "t2.micro"
   key_name = "N-Virginia"
   # vpc_id = "vpc-0dc4cca962421ecd3"
   subnet_id = var.subnet_id
   vpc_security_group_ids = [ aws_security_group.target-sg.id ]
   depends_on = aws_instance.myec2
 }
*/
