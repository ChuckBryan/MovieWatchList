# Product Requirements Document (PRD)

## Movie Watch List

### 1. Overview

A web application that allows users to view popular movies currently playing in theaters and add them to a personal watch list. The watch list is stored in SQL Server.

### 2. Goals

- Display a list of popular movies currently in theaters.
- Allow users to add movies to their watch list.
- Persist the watch list in SQL Server.
- Gather movie data from external sources (e.g., The Movie Database).

### 3. Features

#### 3.1. Movie Discovery

- On startup, show a list of popular movies currently playing in theaters.
- Source movie data from APIs such as The Movie Database (TMDb).
- If the API does not provide "currently playing" movies, use the closest available category (e.g., "popular" or "now playing").

#### 3.2. Watch List Management

- Users can add movies to their watch list.
- Users can view and remove movies from their watch list.
- Watch list data is stored in SQL Server.

#### 3.3. Data Storage

- Use SQL Server to store user watch lists.
- Each watch list entry includes movie ID, title, and relevant metadata.

### 4. Non-Functional Requirements

- Responsive UI for desktop and mobile.
- Secure storage and access to user data.
- Fast loading and API response times.

### 5. Dependencies

- External movie data API (e.g., TMDb).
- SQL Server database.

### 6. Open Questions

- Does the chosen movie API provide "currently playing" movies?
- Will user authentication be required?
- Will the app support multiple users or just a single user?
