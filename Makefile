# ==============================================================================
# Makefile Configuration
# ==============================================================================

# Docker Compose Command
DOCKER_COMMAND=docker compose

# Test Project Configuration
TEST_PROJECT_NAME=BackEnd/UnitTests/UnitTests.csproj

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
# Testing Commands
# ==============================================================================

.PHONY: test

# Target: Build, clear terminal, and run tests with coverage
test:
	dotnet build $(TEST_PROJECT_NAME) -v q && $(CLEAR_CMD) && dotnet test $(TEST_PROJECT_NAME) -v n --no-build /p:CollectCoverage=true

