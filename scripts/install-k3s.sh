#!/bin/bash
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --flannel-backend=wireguard" sh -
