# Start up script that automatically configures and launches our Apache web server

#!/bin/bash
sudo dnf update -y
sudo dnf install -y httpd
sudo cd /var/www/html/
sudo chmod 644 /var/www/html/
sudo touch index.html
sudo chmod 644 /var/www/html/index.html
sudo echo "<h1>Welcome to my first project at Brainwave Matrix Solutions</h1>" > /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd
