#!/bin/bash

# Define control plane addresses
PRIVATE_IP="192.168.1.228"  # Change this to your private control plane IP
PUBLIC_IP="65.34.87.212"  # Change this to your public control plane IP

# Check input argument
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <local|remote> <k3s_node_token>"
    exit 1
fi

MODE=$1
K3S_TOKEN=$2

if [ "$MODE" == "local" ]; then
    K3S_URL="https://${PRIVATE_IP}:6443"
elif [ "$MODE" == "remote" ]; then
    K3S_URL="https://${PUBLIC_IP}:6443"
else
    echo "Invalid argument. Use 'local' for private IP or 'remote' for public IP."
    exit 1
fi

# Install K3s agent
echo "Joining K3s cluster as ${MODE} node..."
curl -sfL https://get.k3s.io | K3S_URL="$K3S_URL" K3S_TOKEN="$K3S_TOKEN" sh -

echo "Node joined successfully!"
