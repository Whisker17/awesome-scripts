#!/bin/bash

# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Go 1.20
if ! command_exists go; then
    echo "Installing Go 1.20..."
    wget https://dl.google.com/go/go1.20.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz
    rm go1.20.linux-amd64.tar.gz
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
    source ~/.bashrc
    echo "Go 1.20 installed successfully."
else
    echo "Go 1.20 is already installed."
fi

echo "Installation completed."

