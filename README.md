# Movie Watch List - Dev Container & Docker Setup

## Getting Started

This project uses VS Code Dev Containers and Docker Compose for a portable, reproducible development environment with SQL Server.

### Prerequisites

- Docker Desktop (Windows/Mac/Linux)
- Visual Studio Code
- Dev Containers extension for VS Code

### Dev Container Workflow

1. Open the project folder in VS Code.
2. When prompted, select "Reopen in Container" or use the Command Palette: `Dev Containers: Reopen in Container`.
3. The container will build and start both the Blazor app and SQL Server automatically.
4. Develop, debug, and run your app in a consistent environment.

### Environment Variables & Secrets

Create a `.env` file in the project root (never commit this file):

```
SQLSERVER_CONNECTION_STRING=Server=db;Database=MovieWatchList;User=sa;Password=Your_password123;
TMDB_API_KEY=your_tmdb_api_key
```

Your app should read these variables using .NET's configuration system. See `appsettings.json` and `Program.cs` for details.

### Docker Compose Details

- The `app` service builds from the included `Dockerfile` and mounts the workspace for live development.
- The `db` service uses the official SQL Server image and exposes port 1433.
- Ports 5231 (app) and 1433 (SQL Server) are forwarded to your host.
- Both services are orchestrated for seamless local development.

### Troubleshooting

- **Dockerfile not found:** Ensure `Dockerfile` is in the project root and `docker-compose.yml` references it correctly.
- **SQL Server connection issues:** Check the password, healthcheck logs, and ensure the `db` service is healthy.
- **Environment variables not loaded:** Make sure `.env` is present and not committed to source control.

---

For more details, see `prd.md` and `.github/copilot-instructions.md`.
