# Dev Container Documentation

## Overview

This dev container provides a complete Python development environment with:
- Python 3.12 (latest)
- UV package manager for fast dependency management
- Docker-in-Docker for container operations
- Pre-configured VS Code extensions and settings

## What's Included

### Base Image
- **Image**: `mcr.microsoft.com/devcontainers/python:1-3.12-bookworm`
- **Python Version**: 3.12
- **OS**: Debian Bookworm

### Features
1. **Docker-in-Docker**: Full Docker daemon inside the container
   - Build and run Docker containers
   - Use Docker Compose
   - Test containerized applications

2. **UV Package Manager**: Modern, fast Python package manager
   - Faster than pip
   - Better dependency resolution
   - Compatible with pip and existing tools

### VS Code Extensions
- `ms-python.python` - Python language support
- `ms-python.vscode-pylance` - Fast Python language server
- `ms-python.debugpy` - Python debugging
- `charliermarsh.ruff` - Fast Python linter and formatter
- `ms-azuretools.vscode-docker` - Docker integration

## Usage Examples

### Python Development

```bash
# Create a virtual environment with UV
uv venv

# Activate the virtual environment
source .venv/bin/activate

# Install project dependencies
uv pip install -e ".[dev]"

# Run the example
python example.py

# Run with ruff linting
ruff check .
ruff format .
```

### Docker Operations

```bash
# Check Docker is available
docker --version
docker info

# Build a Docker image
docker build -t myapp:latest .

# Run a container
docker run -d -p 8000:8000 myapp:latest

# Use Docker Compose
docker compose up -d

# View running containers
docker ps
```

### Package Management with UV

```bash
# Install a package
uv pip install requests numpy pandas

# Install from requirements.txt
uv pip install -r requirements.txt

# Compile dependencies
uv pip compile pyproject.toml -o requirements.txt

# Sync environment with lockfile
uv pip sync requirements.txt

# Uninstall a package
uv pip uninstall requests
```

## Configuration Details

### Post-Create Command
The container runs `.devcontainer/post-create.sh` after creation, which:
1. Downloads and installs UV package manager
2. Adds UV to the PATH in `.bashrc` and `.zshrc`
3. Verifies the installation

### Docker-in-Docker Setup
The container runs with:
- `--privileged` flag for full Docker access
- Docker socket mounted from host (when available)
- Docker Compose v2 installed

### Python Settings
- Ruff enabled for linting and formatting
- Auto-format on save
- Auto-organize imports
- Type checking with Pylance

## Troubleshooting

### UV Not Found
If UV is not in your PATH, manually add it:
```bash
export PATH="$HOME/.cargo/bin:$PATH"
```

### Docker Permission Issues
The container runs with the `vscode` user. If you encounter permission issues:
```bash
# Add user to docker group (if needed)
sudo usermod -aG docker $USER
```

### Port Already in Use
If a port is already in use, you can:
- Change the port in your application
- Stop the conflicting service
- Use a different port mapping

## Customization

### Adding More Extensions
Edit `.devcontainer/devcontainer.json`:
```json
"extensions": [
  "ms-python.python",
  "your-extension-here"
]
```

### Installing Additional Tools
Add commands to `.devcontainer/post-create.sh`:
```bash
# Install additional system packages
sudo apt-get update
sudo apt-get install -y your-package

# Install Python tools
uv pip install your-tool
```

### Changing Python Version
Modify the image tag in `devcontainer.json`:
```json
"image": "mcr.microsoft.com/devcontainers/python:1-3.13-bookworm"
```

## Best Practices

1. **Use UV for Dependencies**: UV is much faster than pip for installing packages
2. **Leverage Docker-in-Docker**: Test your applications in containers without leaving the dev environment
3. **Format on Save**: The container is configured to auto-format with Ruff
4. **Version Control**: Commit `pyproject.toml` and consider using `uv.lock` for reproducibility
5. **Resource Management**: Close unused Docker containers to save resources

## Additional Resources

- [UV Documentation](https://docs.astral.sh/uv/)
- [Dev Containers](https://containers.dev/)
- [Docker Documentation](https://docs.docker.com/)
- [Ruff Documentation](https://docs.astral.sh/ruff/)
- [Python 3.12 What's New](https://docs.python.org/3.12/whatsnew/3.12.html)
