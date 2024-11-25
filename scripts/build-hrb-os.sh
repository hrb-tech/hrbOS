#!/bin/bash

# Create necessary directories if they don't exist
mkdir -p config
mkdir -p build

# Create OS configuration file (yaml)
cat > config/os-config.yaml << 'EOF'
name: "hrbOS"
version: "1.0.0"
base_image: "opensuse/leap:15.4"

packages:
  - docker
  - portainer
  - curl
  - wget
  - git

services:
  enabled:
    - docker
    - portainer

post_install:
  commands:
    - systemctl enable docker
    - docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
EOF

# Create build configuration file
cat > config/build.yaml << 'EOF'
image:
  repository: "hrb/os"
  tag: "latest"

iso:
  filename: "hrbOS.iso"
  label: "HRBOS_INSTALL"
  
boot:
  cmdline: "console=tty1 root=LABEL=COS_STATE"
EOF
