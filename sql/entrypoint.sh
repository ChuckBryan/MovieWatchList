#!/bin/bash

# Start SQL Server
/opt/mssql/bin/sqlservr &

# Wait for SQL Server to be ready
sleep 30s

# Run the initialization script
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i /docker-entrypoint-initdb.d/init.sql

# Keep container running
tail -f /dev/null
