#!/bin/bash

#---------------------------------
# Install LAMP on Amazon Linux 2 |
#---------------------------------

# Update server
yum update -y
# Gets the latest versions of the LAMP MariaDB and PHP packages for Amazon Linux 2
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
# Installs Apache
yum install -y httpd mariadb-server
# Start the Apache web server
systemctl start httpd
# Configure the Apache web server to start at each system boot
systemctl enable httpd

#--------------------------------------------------------
# Set file permissions to a group and add user to group |
#--------------------------------------------------------

# Add user in group apache
usermod -a -G apache ec2-user
# Change ownership of /var/www to the apache group
chown -R ec2-user:apache /var/www
# To add group write permissions, set the group ID on future subdirectories, change the directory permissions
chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
# To add group write permissions, recursively change the file permissions of /var/www and its subdirectories:
find /var/www -type f -exec sudo chmod 0664 {} \;




#-----------
# Database |
#-----------

# Export MySQL and create a new user in database
export MYSQL_HOST=wordpressinstance.cuad9n8pmr8b.eu-west-1.rds.amazonaws.com
mysql --user=admin --password=Kallekalle1 -h wordpressinstance.cuad9n8pmr8b.eu-west-1.rds.amazonaws.com wordpress < databaseuser.sql


