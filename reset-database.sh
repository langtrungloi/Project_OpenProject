#!/bin/bash

echo "Resetting OpenProject database..."

# Dừng containers
docker compose down

# Xóa volume database
sudo rm -rf postgres-data

# Khởi động lại
docker compose up -d

echo "Waiting for database to initialize..."
sleep 30

echo "Database has been reset."