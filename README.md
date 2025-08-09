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


### SQL Server Persistence & Connection String

**Persistence:**
- SQL Server data is stored in a Docker volume (`mssql-data`) for durability between container restarts.
- Initialization scripts in `/sql` ensure the database and tables are created automatically.

**Connection String:**
- Always use `TrustServerCertificate=True;` in your connection string to avoid SSL errors with the container's self-signed certificate.
- Example:
	```
	Server=db;Database=MovieWatchList;User=sa;Password=Your_password123;TrustServerCertificate=True;
	```
- The connection string is set in both `docker-compose.yml` and `appsettings.Client.json`.

**Environment Variables & Secrets:**
Create a `.env` file in the project root (never commit this file):
```
SQLSERVER_CONNECTION_STRING=Server=db;Database=MovieWatchList;User=sa;Password=Your_password123;TrustServerCertificate=True;
TMDB_API_KEY=your_tmdb_api_key
```
Your app should read these variables using .NET's configuration system. See `appsettings.json`, `appsettings.Client.json`, and `Program.cs` for details.

### Docker Compose Details

- The `app` service builds from the included `Dockerfile` and mounts the workspace for live development.
- The `db` service uses the official SQL Server image and exposes port 1433.
- Ports 5231 (app) and 1433 (SQL Server) are forwarded to your host.
- Both services are orchestrated for seamless local development.


### Troubleshooting

- **SQL Server connection issues:**
	- If you see certificate errors, ensure `TrustServerCertificate=True;` is present in your connection string.
	- Check the debug output on the Counter page for the actual connection string and error messages.
	- Use `docker logs moviewatchlist-app-1` to monitor for errors.
- **Persistence issues:**
	- Make sure the Docker volume `mssql-data` is present and mounted.
	- Query the database directly with:
		```
		docker exec moviewatchlist-db-1 /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P Your_password123 -Q "SELECT * FROM MovieWatchList.dbo.ClickCounter"
		```
- **Environment variables not loaded:**
	- Make sure `.env` is present and not committed to source control.
	- Confirm the app is reading from the correct config file (`appsettings.Client.json` for the client).

---

For more details, see `prd.md` and `.github/copilot-instructions.md`.
