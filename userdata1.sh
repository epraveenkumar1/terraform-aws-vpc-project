#!/bin/bash
apt update
apt install -y apache2

# Get the instance ID using the instance metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Install the AWS CLI
apt install -y awscli

# Download the images from S3 bucket
#aws s3 cp s3://myterraformprojectbucket2023/project.webp /var/www/html/project.png --acl public-read

# Create a simple HTML file with the portfolio content and display the images
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Our Services</title>
</head>
<body>
  <h1>Services We Offer</h1>
  <ul>
    <li>Web Design and Development</li>
    <li>Cloud Infrastructure Setup</li>
    <li>DevOps Consulting</li>
    <li>Technical Support</li>
  </ul>
  <p>Contact us to know more about how we can help you grow your business online.</p>
</body>
</html>
EOF

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2