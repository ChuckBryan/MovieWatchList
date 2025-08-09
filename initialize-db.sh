#!/bin/bash

# Run the initialization script in the SQL Server container
echo "Running database initialization script..."
docker exec moviewatchlist-db-1 /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P Your_password123 -i /sql/setup.sql -C

echo "Database initialization completed."
