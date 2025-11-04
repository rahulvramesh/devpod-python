.PHONY: help install install-dev lint format test clean docker-build docker-run docker-compose-up docker-compose-down

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Install project dependencies
	uv pip install -e .

install-dev: ## Install development dependencies
	uv pip install -e ".[dev]"

lint: ## Run linter (ruff check)
	ruff check .

format: ## Format code with ruff
	ruff format .

test: ## Run tests with pytest
	pytest

clean: ## Clean up Python cache files
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type d -name "*.egg-info" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".pytest_cache" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".ruff_cache" -exec rm -rf {} + 2>/dev/null || true

docker-build: ## Build example Docker image
	docker build -f Dockerfile.example -t devpod-python:latest .

docker-run: ## Run example Docker container
	docker run --rm devpod-python:latest

docker-compose-up: ## Start services with docker-compose
	docker compose -f docker-compose.example.yml up -d

docker-compose-down: ## Stop services with docker-compose
	docker compose -f docker-compose.example.yml down

docker-compose-logs: ## View docker-compose logs
	docker compose -f docker-compose.example.yml logs -f
