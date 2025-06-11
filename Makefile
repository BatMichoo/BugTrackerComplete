# ==============================================================================
# Makefile Configuration
# ==============================================================================

# Docker Compose Command
DOCKER_COMMAND=docker compose

# ==============================================================================
# Docker Commands
# ==============================================================================

.PHONY: up down start stop help

# Target: Build and start services in detached mode
up:
	@echo "Building and starting Docker services..."
	@$(DOCKER_COMMAND) up -d --build

# Target: Stop and remove containers, networks, and volumes
down:
	@echo "Stopping and removing Docker containers, networks, and volumes..."
	@$(DOCKER_COMMAND) down -v

# Target: Start existing containers
start:
	@echo "Starting existing Docker containers..."
	@$(DOCKER_COMMAND) start

# Target: Stop running containers
stop:
	@echo "Stopping running Docker containers..."
	@$(DOCKER_COMMAND) stop

# ==============================================================================
# Running Commands (Linux/macOS)
# ==============================================================================

.PHONY: dev-b dev-f dev

# Target: Start Backend (Linux/macOS)
dev-b:
	@echo "Starting Backend API in a new tab..."
	@gnome-terminal --tab --title="Backend API" -- bash -c "cd BackEnd/API/ && dotnet run -v q; exec bash"

# Target: Start Frontend (Linux/macOS)
dev-f:
	@echo "Starting Frontend in a new tab..."
	@gnome-terminal --tab --title="Frontend" -- bash -c "cd FrontEnd/ && npm run dev; exec bash"

# Target: Start both Backend and Frontend (Linux/macOS)
dev: dev-b dev-f

# ==============================================================================
# Running Commands (Windows)
# ==============================================================================

.PHONY: dev-b-w dev-f-w dev-w

# Target: Start Backend (Windows - using Command Prompt)
dev-b-w:
	@echo "Starting Backend API in a new window..."
	@start cmd.exe /k "cd BackEnd/API/ && dotnet run -v q"

# Target: Start Frontend (Windows - using Command Prompt)
dev-f-w:
	@echo "Starting Frontend in a new window..."
	@start cmd.exe /k "cd FrontEnd/ && npm run dev"

# Target: Start both Backend and Frontend (Windows)
dev-w: dev-b-w dev-f-w

# ==============================================================================
# Testing Commands
# ==============================================================================

.PHONY: test

# Target: Build, clear terminal and run tests
test:
	@echo "Building and running Backend Unit Tests..."
	@cd BackEnd/UnitTests && dotnet build -v q --property:WarningLevel=1 && dotnet test -v n --no-build

# ==============================================================================
# Help Command
# ==============================================================================

help:
	@echo " "
	@echo "Available Make Commands:"
	@echo "------------------------"
	@echo " "
	@echo "Docker Commands:"
	@echo "  make up       - Builds and starts Docker services in detached mode (--build)."
	@echo "  make down     - Stops and removes Docker containers, networks, and volumes."
	@echo "  make start    - Starts existing Docker containers."
	@echo "  make stop     - Stops running Docker containers."
	@echo " "
	@echo "Development Commands (Linux/macOS):"
	@echo "  make dev-b    - Starts the Backend API in a new GNOME Terminal tab."
	@echo "  make dev-f    - Starts the Frontend in a new GNOME Terminal tab."
	@echo "  make dev      - Starts both Backend and Frontend in new GNOME Terminal tabs."
	@echo " "
	@echo "Development Commands (Windows):"
	@echo "  make dev-b-w  - Starts the Backend API in a new Command Prompt window."
	@echo "  make dev-f-w  - Starts the Frontend in a new Command Prompt window."
	@echo "  make dev-w    - Starts both Backend and Frontend in new Command Prompt windows."
	@echo " "
	@echo "Testing Commands:"
	@echo "  make test     - Builds and runs Backend Unit Tests."
	@echo " "
	@echo "General Information:"
	@echo "  make help     - Displays this help message."
	@echo " "
