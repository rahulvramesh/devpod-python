#!/bin/bash
set -e

echo "Installing UV package manager..."
curl -LsSf https://astral.sh/uv/install.sh | sh

# Add UV to PATH for the current session
export PATH="$HOME/.cargo/bin:$PATH"

# Add UV to the user's shell profile
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc 2>/dev/null || true

# Verify UV installation
echo "UV installed successfully!"
uv --version || $HOME/.cargo/bin/uv --version

echo "Dev container setup complete!"
