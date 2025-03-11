resource "aws_instance" "jenkins" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkins.id]
  subnet_id = aws_subnet.main.id
#   user_data              = file("userdata/jenkins.sh")
  user_data = <<EOF
#!/bin/bash
sudo apt-get update -y
sudo apt install openjdk-17-jdk -y
sudo apt install maven -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
EOF
  tags = {
    Name = "Jenkins Server"
  }
}

resource "aws_instance" "sonarqube" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sonarqube.id]
  subnet_id = aws_subnet.main.id
#   user_data              = file("userdata/sonarqube.sh")
  user_data = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt install docker.io -y
sudo docker run -itd --name sonarqube -p 9000:9000 sonarqube:lts
EOF

  tags = {
    Name = "SonarQube Server"
  }
}

resource "aws_instance" "nexus2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.nexus.id]
  subnet_id = aws_subnet.main.id
#   user_data              = file("userdata/nexus.sh")
  user_data = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt install openjdk-8-jdk -y
cd /opt
sudo wget https://sonatype-download.global.ssl.fastly.net/repository/downloads-prod-group/3/nexus-unix-x86-64-3.78.0-14.tar.gz
sudo tar -xvf nexus-*.tar.gz
sudo mv nexus-* nexus
sudo /opt/nexus/bin/nexus start
EOF
  tags = {
    Name = "Nexus Artifactory"
  }
}

resource "aws_instance" "tomcat2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.tomcat.id]
  subnet_id = aws_subnet.main.id
#   user_data              = file("userdata/tomcat.sh")
  user_data = <<EOF
#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install openjdk-17-jdk -y
sudo apt install tomcat9 tomcat9-admin tomcat9-common -y
sudo systemctl start tomcat9
sudo systemctl enable tomcat9
EOF
  tags = {
    Name = "Tomcat Server"
  }
}
