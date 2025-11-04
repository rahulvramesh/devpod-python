# devpod-python

DevContainer for Python with UV package manager and Docker-in-Docker support.

## Features

- 🐍 **Latest Python 3.12** - Uses the official Microsoft DevContainer Python image
- 📦 **UV Package Manager** - Fast, modern Python package manager
- 🐳 **Docker-in-Docker** - Full Docker support inside the container for maximum control
- 🛠️ **Pre-configured Tools** - Includes Ruff linter/formatter, Python extensions, and more

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop) installed
- [VS Code](https://code.visualstudio.com/) with [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) OR
- [DevPod](https://devpod.sh/) CLI

### Using with VS Code

1. Open this repository in VS Code
2. When prompted, click "Reopen in Container" or run the command "Dev Containers: Reopen in Container"
3. Wait for the container to build and start
4. You're ready to code!

### Using with DevPod

```bash
devpod up github.com/rahulvramesh/devpod-python
```

## Quick Start Commands

We provide a Makefile with convenient commands:

```bash
# Show all available commands
make help

# Install dependencies
make install-dev

# Run linter
make lint

# Format code
make format

# Build Docker example
make docker-build

# Run Docker example
make docker-run
```

## Using UV Package Manager

UV is automatically installed in the dev container. Here are some common commands:

```bash
# Create a new virtual environment
uv venv

# Install dependencies from pyproject.toml
uv pip install -e ".[dev]"

# Add a new package
uv pip install requests

# Sync dependencies
uv pip sync requirements.txt
```

## Docker-in-Docker

The container has full Docker support, allowing you to:

- Build Docker images
- Run containers
- Use Docker Compose
- Test containerized applications

```bash
# Check Docker is working
docker --version
docker ps

# Build and run containers as needed
docker build -t myapp .
docker run myapp
```

## Customization

The dev container configuration is located in `.devcontainer/devcontainer.json`. You can:

- Add more VS Code extensions
- Install additional tools in `post-create.sh`
- Modify Python settings
- Add more features

## Project Structure

```
.
├── .devcontainer/
│   ├── devcontainer.json           # Dev container configuration
│   └── post-create.sh               # Setup script (installs UV)
├── pyproject.toml                   # Python project configuration
├── example.py                       # Example Python file
├── Dockerfile.example               # Example Dockerfile for Docker-in-Docker
├── docker-compose.example.yml      # Example Docker Compose file
├── Makefile                         # Convenient make commands
├── DEVCONTAINER.md                  # Detailed dev container docs
└── README.md                        # This file
```

## Documentation

- **[DEVCONTAINER.md](DEVCONTAINER.md)** - Comprehensive dev container documentation
- **[README.md](README.md)** - This quick start guide

## License

MIT
