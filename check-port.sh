#!/bin/bash
# File: check-ports.sh

echo "🔍 Checking port usage..."

echo "Port 5432 (PostgreSQL default):"
sudo lsof -i :5432 | grep LISTEN || echo "✅ Port 5432 is available"

echo ""
echo "Port 54321:"
sudo lsof -i :54321 | grep LISTEN || echo "✅ Port 54321 is available"

echo ""
echo "Port 54333 (our PostgreSQL):"
sudo lsof -i :54333 | grep LISTEN || echo "✅ Port 54333 is available"

echo ""
echo "Port 8686 (our OpenProject):"
sudo lsof -i :8686 | grep LISTEN || echo "✅ Port 8686 is available"

echo ""
echo "📊 Current Docker containers using ports:"
docker ps --format "table {{.Names}}\t{{.Ports}}"