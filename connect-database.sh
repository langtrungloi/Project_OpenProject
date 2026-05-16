#!/bin/bash
# File: connect-database.sh

echo "🔌 Connecting to PostgreSQL on port 54333..."

# Sử dụng psql client từ host
psql -h localhost -p 54333 -U openproject -d openproject

# Nếu không có psql client, sử dụng container
# docker exec -it openproject_postgres psql -U openproject -d openproject