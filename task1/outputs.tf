# Outputs useful info


# Displays the public ip address of the EC2 instance
output "instance_ip" {
  value = aws_instance.brainwave_web_app.public_ip
}


#Displays the web url using the instance public DNS for browser access
output "web_url" {
  value = "http://${aws_instance.brainwave_web_app.public_dns}"
}

