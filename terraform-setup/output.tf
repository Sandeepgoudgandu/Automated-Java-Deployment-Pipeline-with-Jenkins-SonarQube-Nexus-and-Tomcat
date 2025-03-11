output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}

output "sonarqube_public_ip" {
  value = aws_instance.sonarqube.public_ip
}

output "nexus_public_ip" {
  value = aws_instance.nexus2.public_ip
}

output "tomcat_public_ip" {
  value = aws_instance.tomcat2.public_ip
}
