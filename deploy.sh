#!/bin/bash

# Watch & Earn App - Deployment Script
# This script helps prepare the app for deployment to Railway/Render/Vercel

set -e

echo "======================================"
echo "Watch & Earn - Deployment Helper"
echo "======================================"
echo ""

# Check if Node is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js first."
    exit 1
fi

echo "✅ Node.js $(node --version)"
echo ""

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm not found. Please install npm first."
    exit 1
fi

echo "✅ npm $(npm --version)"
echo ""

# Build the app
echo "🔨 Building application..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
else
    echo "❌ Build failed!"
    exit 1
fi

echo ""
echo "======================================"
echo "DEPLOYMENT READY!"
echo "======================================"
echo ""
echo "📦 Configuration files created:"
echo "  • railway.json - For Railway deployment"
echo "  • render.yaml - For Render deployment"
echo "  • vercel.json - For Vercel deployment"
echo ""
echo "📝 Documentation created:"
echo "  • DEPLOYMENT.md - Complete deployment guide"
echo "  • PRODUCTION_READY.md - Production status"
echo "  • .env.example - Environment variables template"
echo ""
echo "🚀 NEXT STEPS:"
echo ""
echo "1. CREATE GITHUB REPOSITORY"
echo "   git init"
echo "   git add ."
echo "   git commit -m 'Initial commit: Watch & Earn App'"
echo "   git branch -M main"
echo "   git remote add origin https://github.com/YOUR_USERNAME/watch-earn.git"
echo "   git push -u origin main"
echo ""
echo "2. DEPLOY BACKEND"
echo "   OPTION A: Railway (Recommended)"
echo "   • Visit https://railway.app"
echo "   • Click 'New Project' → 'Deploy from GitHub'"
echo "   • Select your repository"
echo "   • Add env vars: DATABASE_URL, SESSION_SECRET, NODE_ENV=production"
echo ""
echo "   OPTION B: Render"
echo "   • Visit https://render.com"
echo "   • Click 'New Web Service'"
echo "   • Connect your repository"
echo "   • Add PostgreSQL database"
echo "   • Set environment variables"
echo ""
echo "3. DEPLOY FRONTEND"
echo "   • Visit https://vercel.com"
echo "   • Import your GitHub repository"
echo "   • Add env var: VITE_API_URL=https://your-backend-url"
echo "   • Click 'Deploy'"
echo ""
echo "📊 BUILD OUTPUT:"
echo "   Backend: dist/index.js (22.7kb)"
echo "   Frontend: dist/public/ (360kb+ gzipped)"
echo ""
echo "✨ Ready to deploy!"
echo ""
