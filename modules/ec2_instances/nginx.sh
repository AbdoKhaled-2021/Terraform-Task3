#! /bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo bash -c 'echo \server {,
           listen 80;,
        location / { ,
             proxy_pass http://${var.private_load_balancer_dns}; ,
         },
      }\ > /etc/nginx/sites-available/default',

sudo systemctl restart nginx
