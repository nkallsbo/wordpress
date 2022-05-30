
#!/bin/bash

# Mount to EFS
mount -t efs -o tls fs-09a5941278d57ae6f:/ /var/www/html/
# Download Wordpress
wget https://wordpress.org/latest.tar.gz
# Unzip files
tar -xzf latest.tar.gz
# Move wordpress files to the mounted folder
sudo cp -r wordpress/* /var/www/html/
# Move to wordpress directory
cd /var/www/html/
# Create wp-config file from sample file
cp wp-config-sample.php wp-config.php
# Opens the configfile, manually edit
nano wp-config.php
