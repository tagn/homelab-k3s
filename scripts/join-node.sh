#!/bin/bash

CONTROL_PLANE_IP="$1"

# Check input argument
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <control_plane_ip> <k3s_node_token>"
    exit 1
fi

K3S_TOKEN=$2


# Install K3s agent
echo "Joining K3s cluster as ${MODE} node..."
curl -sfL https://get.k3s.io | K3S_URL="$K3S_URL" K3S_TOKEN="$K3S_TOKEN" sh -

echo "Node joined successfully!"
