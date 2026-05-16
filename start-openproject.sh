#!/bin/bash
# File: start-openproject.sh

echo "🚀 Starting OpenProject 16.6 with PostgreSQL 17..."

# Kiểm tra port đang sử dụng
echo "🔍 Checking port availability..."

if lsof -Pi :54333 -sTCP:LISTEN -t >/dev/null ; then
    echo "❌ Port 54333 is already in use. Please free up this port."
    exit 1
fi

if lsof -Pi :8686 -sTCP:LISTEN -t >/dev/null ; then
    echo "❌ Port 8686 is already in use. Please free up this port."
    exit 1
fi

# Kiểm tra Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

# Kiểm tra Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Tạo secret key nếu chưa có
if [ -z "$(grep OPENPROJECT_SECRET_KEY_BASE .env 2>/dev/null)" ]; then
    echo "🔑 Generating secret key base..."
    SECRET_KEY=$(openssl rand -hex 64)
    echo "OPENPROJECT_SECRET_KEY_BASE=$SECRET_KEY" >> .env
fi

# Khởi động services
echo "📦 Pulling Docker images..."
docker-compose pull

echo "🔄 Starting containers..."
docker-compose up -d

echo "⏳ Waiting for services to start..."
sleep 30

# Kiểm tra trạng thái
echo "🔍 Checking services status..."
docker-compose ps

echo "📊 Checking PostgreSQL logs..."
docker-compose logs postgres --tail=10

echo "📋 Checking OpenProject logs..."
docker-compose logs openproject --tail=10

echo "✅ Setup completed!"
echo "🌐 OpenProject is available at: http://localhost:8081"
echo "🐘 PostgreSQL is running on: localhost:5433"
echo ""
echo "📝 Default credentials (first time setup):"
echo "   Username: admin"
echo "   Password: admin"
echo ""
echo "🔧 Useful commands:"
echo "   View logs: docker-compose logs -f"
echo "   Stop services: docker-compose down"
echo "   Restart services: docker-compose restart"
echo "   Check status: docker-compose ps"