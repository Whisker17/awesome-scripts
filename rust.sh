#!/bin/bash

# Install Rust using Rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Add Rust binaries to PATH
source $HOME/.cargo/env

# Verify Rust installation
rustc --version
cargo --version

