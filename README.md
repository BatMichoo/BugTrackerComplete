# Bug Tracker Application

This repository contains the source code and configuration for a Bug Tracker application, consisting of a backend API, a frontend user interface, and a SQL Server database.

## Setup Instructions

Follow these steps to set up and run the Bug Tracker application on your local machine.

### Prerequisites

Before you begin, ensure you have the following installed:

* **Docker:** Docker is used to containerize and manage the application's services. You can download and install it from the official Docker website: [https://www.docker.com/get-started/](https://www.docker.com/get-started/)
* **Docker Compose:** Docker Compose is a tool for defining and managing multi-container Docker applications. It is usually installed along with Docker Desktop. If you need to install it separately, follow the instructions here: [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)
* **Make (Optional but Recommended):** The provided `Makefile` significantly simplifies common development tasks, including Docker commands. Running `make help` from the project root will display a quick overview of all available commands. If you don't have Make installed, you can still execute the underlying `docker compose` or `dotnet` commands directly.
    * [Make Installation Guide](https://www.gnu.org/software/make/manual/html_node/Installation.html)
    * **Docker Compose Version Note:** Depending on your Docker Compose version, the command used in the `Makefile` might need a slight adjustment.
        * **Docker Compose V2 (recommended, newer syntax):** Uses `docker compose` (two words). This is the default in recent Docker Desktop versions.
        * **Docker Compose V1 (legacy syntax):** Uses `docker-compose` (hyphenated).
        If you encounter issues with `make` and Docker commands, check the `DOCKER_COMMAND` variable at the top of the `Makefile` and adjust it if necessary (e.g., `DOCKER_COMMAND=docker-compose`).
### Configuration

The application relies on environment variables for configuration. You need to create a `.env` file in the root of the project directory and define the following variables:

```env
SA_PASSWORD=<YourStrongSQLServerPassword>
SQL_USER=sa
SQL_DATABASE=BugTrackerDB
SQL_SERVER_HOST=sqlserver # This should match the service name in docker-compose.yml

HTTP_SERVER_PORT=5000
HTTPS_SERVER_PORT=5001
REACT_APP_PORT=3000
DOMAIN_URL=http://localhost:3000 # Adjust if your frontend runs on a different host/port
JWT_SECRET_KEY=<YourSecureJwtSecretKey>
ASPNETCORE_ENVIRONMENT=Development # Or Production, Staging, etc.
