#!/bin/bash
cp -r ./static-site/* /var/www/html/
systemctl restart nginx
echo "Site deployed!" >> logs/toolkit.log
