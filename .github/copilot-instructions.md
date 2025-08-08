# Copilot Instructions for Movie Watch List

## Project Overview

- .NET-based web application for managing a personal movie watch list.
- Displays popular movies currently playing in theaters, sourced from external APIs (e.g., The Movie Database).
- Users can add movies to their watch list, stored in SQL Server.
- Uses Blazor Interactive Auto Render Mode: SSR (Server-Side Rendering) for initial load, then CSR (Client-Side Rendering) after Blazor bundle downloads.

## Architecture & Data Flow

- **Frontend**: Blazor Server handles SSR for fast initial load and SEO; Blazor WebAssembly takes over for CSR for rich interactivity.
- **Backend**: Handles API integration for movie data and CRUD operations for the watch list.
- **Database**: SQL Server stores watch list entries (movie ID, title, metadata).

## Developer Workflows

- Build and run using standard .NET commands (`dotnet build`, `dotnet run`).
- Database connection strings and sensitive data managed via environment variables (see `.gitignore` for `.env` exclusion).
- External API keys (e.g., TMDb) should not be committed; use local secrets.
- Create the Blazor app with Interactive Auto Render Mode:
  `dotnet new blazor --use-interactive-render-mode`

## Patterns & Conventions

- Use async/await for all I/O operations.
- Watch list operations encapsulated in a repository/service layer.
- API integration code isolated for easy swapping of movie data sources.
- UI should be responsive and optimized for desktop and mobile.
- Use a CSS framework (Bootstrap, Tailwind, MudBlazor) for desktop/mobile support.
- Layouts should adapt to screen size using grid/flex utilities.
- Example: Add Bootstrap via NuGet or CDN, then use grid classes for layout.

## Integration Points

- Movie data fetched from external APIs (e.g., TMDb). If “currently playing” is unavailable, fallback to “popular” or “now playing.”
- SQL Server required for persistent storage; ensure local or cloud instance is available for development.

## Key Files & Directories

- `prd.md`: Product requirements and high-level goals.
- `.gitignore`: Excludes build artifacts, logs, and secrets.
- (Add references to main backend/frontend files as the project grows.)

## Example Patterns

- When adding a new movie source, implement a provider interface and register it in the backend.
- For new watch list features, update the repository/service and ensure SQL schema changes are documented.

## Learning Guidance

- Explain Blazor concepts, SSR/CSR, and architectural decisions in comments and documentation.
- Reference latest docs and samples from MCP Content7 for best practices.
