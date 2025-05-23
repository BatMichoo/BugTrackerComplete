# ==============================================================================
# Makefile Configuration
# ==============================================================================

# Docker Compose Command
DOCKER_COMMAND=docker compose

# Conditional Terminal Clear Command based on OS
# Sets 'cls' for Windows, defaults to 'clear' for Linux/macOS/WSL
ifeq ($(OS),Windows_NT)
    CLEAR_CMD = cls
else
    CLEAR_CMD = clear
endif

# ==============================================================================
# Docker Commands
# ==============================================================================

.PHONY: up down start stop

# Target: Build and start services in detached mode
up:
	$(DOCKER_COMMAND) up -d --build

# Target: Stop and remove containers, networks, and volumes
down:
	$(DOCKER_COMMAND) down -v

# Target: Start existing containers
start:
	$(DOCKER_COMMAND) start

# Target: Stop running containers
stop:
	$(DOCKER_COMMAND) stop

# ==============================================================================
# Running Commands
# ==============================================================================

.PHONY: dev-b dev-f

# Target: Start Backend
dev-b:
	cd BackEnd/API/ && dotnet run --property:WarningLevel=1 && cd ../..

# Target: Start Frontend
dev-f:
	cd FrontEnd/ && npm run dev && cd ../..

# ==============================================================================
# Testing Commands
# ==============================================================================

.PHONY: test

# Target: Build, clear terminal and run tests
test:
	cd BackEnd/UnitTests && dotnet build -v q && $(CLEAR_CMD) && dotnet test -v n --no-build

