resource "aws_security_group" "qualys-sg" {
  name        = "ec2-qualys"
  description = "allow taraffic from outside to qualys instance"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-qualys"
  }
}

resource "aws_security_group" "target-sg" {
  name        = "target-sg"
  description = "allow taraffic from only qualys instance"
  vpc_id = var.vpc_id

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = [ aws_security_group.qualys-sg.id ]
  }
  tags = {
    Name = "ec2-qualys"
  }
}
