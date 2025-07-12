#!/usr/bin/env bash

# install_docker_portainer.sh
# This script updates the system, installs Docker Engine, and sets up Portainer on Kali Linux.

set -e  # Exit on error

echo "🔄 Updating package index..."
sudo apt update

echo "⬆️ Upgrading installed packages..."
sudo apt upgrade -y

echo "🧹 Removing old Docker versions if any..."
sudo apt remove -y docker docker-engine docker.io containerd runc || true

echo "📦 Installing prerequisite packages..."
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "🔐 Adding Docker’s official GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "➕ Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 Updating package index with Docker repo..."
sudo apt update

echo "🐳 Installing Docker Engine and related packages..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "🔁 Enabling and starting Docker service..."
sudo systemctl enable --now docker

# Optional: Add current user to 'docker' group (requires logout/login)
# sudo usermod -aG docker "$USER"

echo "📁 Creating Portainer data directory..."
sudo mkdir -p /opt/portainer/data

echo "🚀 Running Portainer container..."
sudo docker run -d \
  --name portainer \
  --restart=always \
  -p 9443:9443 -p 9000:9000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /opt/portainer/data:/data \
  portainer/portainer-ce:latest

echo "✅ Done! Access Portainer at:
    http://<your-server-ip>:9000
or https://<your-server-ip>:9443
to complete the initial admin setup."
