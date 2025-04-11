#cloud-config
#!/bin/bash
apt update -y
apt install -y docker.io nginx certbot python3-certbot-nginx git

# Clone your repo (replace with actual repo URL)
git clone https://github.com/yourusername/hospital-voicebot.git
cd hospital-voicebot

# Build and run Docker container
docker build -t voicebot .
docker run -d -p 8000:8000 --name hospital-voicebot voicebot

# Configure Nginx
cat <<EOF > /etc/nginx/sites-available/default
server {
    listen 80;
    server_name vois-ai.ae;

    location / {
        proxy_pass http://localhost:8000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

systemctl restart nginx
