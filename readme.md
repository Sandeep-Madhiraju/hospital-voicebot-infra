# 🏥 Hospital Voice Bot – Terraform EC2 Deployment

This project provisions an AWS EC2 instance, installs Docker, Nginx, and your voice bot app, and serves it at `https://vois-ai.ae`.

## ✅ Features
- One-command deploy using Terraform
- Secure HTTPS via Let's Encrypt
- Automatically builds & runs your Docker-based voicebot

## 🚀 How to Deploy

### 1. Prerequisites
- AWS credentials configured (`~/.aws/credentials`)
- Terraform installed
- SSH key at `~/.ssh/id_rsa.pub`
- Domain `vois-ai.ae` pointed to EC2 public IP

### 2. Run Terraform
```bash
git clone https://github.com/yourusername/hospital-voicebot-infra.git
cd hospital-voicebot-infra

terraform init
terraform apply -auto-approve
```

### 3. Get EC2 Public IP
After deployment, SSH into your server:
```bash
ssh -i ~/.ssh/id_rsa ubuntu@<EC2_PUBLIC_IP>
```

### 4. Enable SSL
```bash
sudo certbot --nginx -d vois-ai.ae
```

That's it! Your voicebot is now live on HTTPS.
