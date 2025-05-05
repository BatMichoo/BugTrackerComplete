# Bug Tracker Application

This repository contains the source code and configuration for a Bug Tracker application, consisting of a backend API, a frontend user interface, and a SQL Server database.

## Setup Instructions

Follow these steps to set up and run the Bug Tracker application on your local machine.

### Prerequisites

Before you begin, ensure you have the following installed:

* **Docker:** Docker is used to containerize and manage the application's services. You can download and install it from the official Docker website: [https://www.docker.com/get-started/](https://www.docker.com/get-started/)
* **Docker Compose:** Docker Compose is a tool for defining and managing multi-container Docker applications. It is usually installed along with Docker Desktop. If you need to install it separately, follow the instructions here: [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)
* **Make (Optional but Recommended):** The provided `Makefile` simplifies common Docker commands. If you don't have Make installed, you can still use the `docker-compose` commands directly. You can find installation instructions for your operating system here: [https://www.gnu.org/software/make/manual/html_node/Installation.html](https://www.gnu.org/software/make/manual/html_node/Installation.html)

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
