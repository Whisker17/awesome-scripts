#!/bin/bash

# Step 1: Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc

# Step 2: Install Node.js v16.19.1 using NVM
nvm install 16.19.1
nvm use 16.19.1
nvm alias default 16.19.1

# Step 3: Install TypeScript
npm install -g typescript

# Step 4: Verify installations
node --version
npm --version
tsc --version

