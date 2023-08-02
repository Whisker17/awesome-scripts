#!/bin/bash

# 1. Check if Rust is installed, if not, install Rust
if ! command -v rustc &>/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source $HOME/.cargo/env
fi

# 2. Install protobuf-compiler
sudo apt-get update
sudo apt-get install -y protobuf-compiler

# 3. Install wasm32-unknown-unknown target
rustup target add wasm32-unknown-unknown

# 4. Install libclang and find the path of libclang.so* on the system, then set LIBCLANG_PATH to that path
sudo apt-get install -y clang
export LIBCLANG_PATH=$(dirname "$(find /usr -name 'libclang-*.so' -print -quit)")

# 5. Create a 'w3f' directory
mkdir -p w3f/binaryen

# 6. Download the latest version of binaryen
LATEST_BINARYEN_URL=$(curl -s https://api.github.com/repos/WebAssembly/binaryen/releases/latest | grep "browser_download_url.*binaryen-version.*x86_64-linux.tar.gz" | cut -d '"' -f 4)
wget -q $LATEST_BINARYEN_URL -O w3f/binaryen/latest_binaryen.tar.gz

# 7. Extract only the 'bin/' folder from the downloaded tarball
tar -xzf w3f/binaryen/latest_binaryen.tar.gz -C w3f/binaryen --strip-components=1 --wildcards '*/bin/*'
rm w3f/binaryen/latest_binaryen.tar.gz

echo "Setup completed successfully!"
