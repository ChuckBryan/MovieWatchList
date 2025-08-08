# Movie Watch List - Dev Container & Docker Setup

## Getting Started

This project uses VS Code Dev Containers and Docker Compose for a portable development environment with SQL Server.

### Prerequisites

- Docker Desktop (Windows/Mac/Linux)
- Visual Studio Code
- Dev Containers extension for VS Code

### Dev Container Usage

1. Open the project folder in VS Code.
2. When prompted, "Reopen in Container" or use the Command Palette: `Dev Containers: Reopen in Container`.
3. The container will build and start the app and SQL Server automatically.

### Environment Variables

- Set secrets in a `.env` file (not committed):
  - `SQLSERVER_CONNECTION_STRING=Server=db;Database=MovieWatchList;User=sa;Password=Your_password123;`
  - `TMDB_API_KEY=your_tmdb_api_key`

### Docker Compose

- The app service builds from the included `Dockerfile`.
- The db service uses the official SQL Server image.
- Ports 5231 (app) and 1433 (SQL Server) are forwarded.

### Troubleshooting

- If you see `ENOENT: no such file or directory, open '.../Dockerfile'`, ensure the `Dockerfile` exists in the project root.
- For SQL Server connection issues, check the password and healthcheck logs.

---

For more details, see `prd.md` and `.github/copilot-instructions.md`.
