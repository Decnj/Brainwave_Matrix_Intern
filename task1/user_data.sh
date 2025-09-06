# Start up script that automatically configures and launches our Apache web server

#!/bin/bash

# Update packages
sudo dnf update -y

# Install Apache web server
sudo dnf install -y httpd

# Start and enable Apache server on instance launch
sudo systemctl start httpd
sudo systemctl enable httpd

# Add a simple HTML homepage
sudo echo "<h1>Welcome to Brainwave Matrix Solutions</h1>
<h2>Brainwave Matrix Solutions</h2>
<p>At Brainwave Matrix Solutions, we specialize in transforming 
digital dreams into reality. We are a dynamic and innovative 
technology company committed to transforming businesses through 
cutting-edge IT solutions. Our expertise spans a wide range of 
services designed to meet the diverse needs of modern enterprises. 
our mission is to empower businesses by providing robust, scalable, 
and innovative IT solutions that drive growth and efficiency.</p>" 
> /var/www/html/index.html
