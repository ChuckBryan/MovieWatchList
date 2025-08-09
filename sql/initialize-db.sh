#!/bin/bash
set -e

# Wait for SQL Server to be ready (wait for healthcheck)
echo "Waiting for SQL Server to be ready..."
sleep 30s

# Run the initialization script
echo "Running database initialization script..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i /sql/setup.sql

echo "Database initialization completed."
