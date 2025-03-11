# Basic Security Group
resource "aws_security_group" "jenkins" {
  name        = "jenkins-sg"
  description = "jenkins security group"
  vpc_id      = aws_vpc.main.id # Replace with your VPC 

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Or a more restrictive CIDR
  }

  ingress {
    description = "Allow Jenkins access from your IP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Use your IP with /32
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-sg"
  }
}

resource "aws_security_group" "sonarqube" {
  name        = "sonarqube-sg"
  description = "sonarqube security group"
  vpc_id      = aws_vpc.main.id # Replace with your VPC ID

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Or a more restrictive CIDR
  }

  ingress {
    description = "Allow Jenkins access from your IP"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Use your IP with /32
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sonarqube-sg"
  }
}

resource "aws_security_group" "nexus" {
  name        = "nexus-sg"
  description = "nexus security group"
  vpc_id      = aws_vpc.main.id # Replace with your VPC ID

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Or a more restrictive CIDR
  }

  ingress {
    description = "Allow Jenkins access from your IP"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Use your IP with /32
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nexus-sg"
  }
}


resource "aws_security_group" "tomcat" {
  name        = "tomcat-sg"
  description = "tomcat security group"
  vpc_id      = aws_vpc.main.id # Replace with your VPC ID

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Or a more restrictive CIDR
  }

  ingress {
    description = "Allow Jenkins access from your IP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Use your IP with /32
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tomcat-sg"
  }
}
