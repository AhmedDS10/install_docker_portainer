#!/usr/bin/env bash

# install_docker_portainer_rpi.sh
# Script for installing Docker & Portainer on Raspberry Pi OS

set -e

echo "🔄 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "🧹 Removing old Docker versions (if any)..."
sudo apt remove -y docker docker-engine docker.io containerd runc || true

echo "📦 Installing prerequisites..."
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "🔐 Adding Docker's GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "➕ Adding Docker repo..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 Updating package index..."
sudo apt update

echo "🐳 Installing Docker Engine..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "🔁 Enabling Docker service..."
sudo systemctl enable --now docker

# Optional: Add user to docker group (requires logout/login)
# sudo usermod -aG docker $USER

echo "📁 Creating Portainer data directory..."
sudo mkdir -p /opt/portainer/data

echo "🚀 Running Portainer for Raspberry Pi (arm)..."
sudo docker run -d \
  --name portainer \
  --restart=always \
  -p 9443:9443 -p 9000:9000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /opt/portainer/data:/data \
  portainer/portainer-ce:latest

echo "✅ Installation complete!"
echo "Access Portainer at:"
echo "  👉 http://<your-raspberry-ip>:9000"
echo "  👉 https://<your-raspberry-ip>:9443"
