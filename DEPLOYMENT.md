# Watch & Earn Application - Deployment Guide

## 🚀 Quick Start Deployment

This guide covers deploying the backend to **Railway** or **Render** (free tier) and the frontend to **Vercel** (free tier).

---

## 📦 BACKEND DEPLOYMENT

### Option 1: Railway (Recommended - Easiest)

#### Step 1: Push to GitHub
```bash
git add .
git commit -m "Ready for deployment"
git push origin main
```

#### Step 2: Deploy to Railway
1. Go to [railway.app](https://railway.app)
2. Click "New Project" → "Deploy from GitHub"
3. Select your repository
4. Railway will auto-detect the `railway.json` configuration
5. Add environment variables:
   - `DATABASE_URL`: Railway will auto-provision PostgreSQL (use the plugin)
   - `SESSION_SECRET`: Generate a random string or use Railway's auto-generate
   - `NODE_ENV`: `production`

#### Step 3: Auto-Deploy
Railway automatically deploys on every push to main branch

**Backend URL**: `https://your-project-name.up.railway.app`

---

### Option 2: Render (Free Alternative)

#### Step 1: Deploy to Render
1. Go to [render.com](https://render.com)
2. Click "New +" → "Web Service"
3. Select "Public Git repository" → paste your GitHub repo URL
4. Fill in settings:
   - **Name**: `watch-earn-backend`
   - **Environment**: `Node`
   - **Build Command**: `npm run build`
   - **Start Command**: `npm start`
   - **Plan**: `Free`

#### Step 2: Add Database
1. In Render dashboard, click "New +" → "PostgreSQL"
2. Name it: `watch-earn-db`
3. Copy the connection string

#### Step 3: Set Environment Variables
In Render Web Service settings, add:
- `DATABASE_URL`: Paste the PostgreSQL connection string
- `SESSION_SECRET`: Generate a random string (e.g., `openssl rand -hex 32`)
- `NODE_ENV`: `production`

**Backend URL**: `https://your-project-name.onrender.com`

---

## 🎨 FRONTEND DEPLOYMENT (Vercel)

### Step 1: Split Frontend/Backend Repos

Since Vercel expects frontend-only repo, create a separate repository:

```bash
# Create new directory for frontend
mkdir watch-earn-frontend
cd watch-earn-frontend

# Clone and extract frontend
git clone YOUR_MAIN_REPO temp
cp -r temp/client/* .
cp temp/vite.config.ts .
cp temp/package.json .
cp temp/tailwind.config.ts .
cp temp/postcss.config.js .
cp temp/tsconfig.json .
cp -r temp/shared ./shared

# Initialize git and push
git init
git add .
git commit -m "Frontend for Vercel"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/watch-earn-frontend.git
git push -u origin main
```

### Step 2: Create vercel.json
The `vercel.json` file is already included at the root. Vercel will auto-detect it.

### Step 3: Deploy to Vercel
1. Go to [vercel.com](https://vercel.com)
2. Click "New Project" → Import Git Repository
3. Select your frontend repository
4. Vercel auto-detects `vercel.json`
5. Build settings should be auto-filled
6. Add environment variable:
   - **Key**: `VITE_API_URL`
   - **Value**: `https://your-backend-url.railway.app` (or .onrender.com)
7. Click "Deploy"

**Frontend URL**: `https://your-project-name.vercel.app`

---

## ✅ Verification Checklist

After deployment, test these endpoints:

### 1. User Registration
```bash
curl -X POST https://YOUR_BACKEND_URL/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"name":"Test User","phone":"03001234567","password":"test123"}'
```

### 2. Get Packages
```bash
curl https://YOUR_BACKEND_URL/api/packages
```

### 3. Admin Login
```bash
curl -X POST https://YOUR_BACKEND_URL/api/auth/admin/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@app.com","password":"admin123"}'
```

### 4. Frontend Access
- Visit `https://your-frontend-url.vercel.app`
- You should see the login page

---

## 🔒 Security Checklist

- [ ] Set `NODE_ENV=production` on backend
- [ ] Generate secure `SESSION_SECRET` (use `openssl rand -hex 32`)
- [ ] Use HTTPS URLs (both Railway/Render provide this)
- [ ] Keep `DATABASE_URL` secret (use platform env vars, not .env)
- [ ] Update CORS settings if frontend and backend on different domains
- [ ] Never commit `.env` file with real credentials

---

## 📊 Environment Variables Summary

### Backend (Railway/Render)
| Variable | Value | Example |
|----------|-------|---------|
| `DATABASE_URL` | PostgreSQL connection string | `postgresql://user:pass@host:5432/db` |
| `SESSION_SECRET` | Random secure string | Generate with `openssl rand -hex 32` |
| `NODE_ENV` | `production` | `production` |
| `PORT` | (auto-assigned) | Usually `10000` on Render, `3000+` on Railway |

### Frontend (Vercel)
| Variable | Value | Example |
|----------|-------|---------|
| `VITE_API_URL` | Backend URL | `https://your-backend.railway.app` |

---

## 🐛 Troubleshooting

### Build Fails
- Check logs in Railway/Render dashboard
- Ensure `npm run build` works locally: `npm run build`

### Database Connection Fails
- Verify `DATABASE_URL` format
- Test connection: `psql $DATABASE_URL`

### API Calls from Frontend Fail
- Check browser console for CORS errors
- Verify `VITE_API_URL` env var is set correctly
- Check backend logs

### Admin Login Not Working
- Ensure database was seeded (runs automatically on startup)
- Check: admin@app.com / admin123

---

## 📱 Test Accounts

### Admin Account
- **Email**: admin@app.com
- **Password**: admin123
- **Access**: /admin/login

### Test User (After Registration)
- **Phone**: 03001234567 (or any valid phone)
- **Password**: Any password you set
- **Flow**: Register → Pay → Wait for admin approval → Dashboard

---

## 🔄 Auto-Redeployment

### Railway
- Automatic on every push to main branch
- Configure in "Settings" → "GitHub"

### Render
- Automatic on every push (if connected)
- Configure in "Settings" → "GitHub"

### Vercel
- Automatic on every push to main branch
- Configure in project settings

---

## 💾 Database Backups

### Railway
- Automatic daily backups included with free tier
- Access in project → PostgreSQL plugin → "Backups"

### Render
- Free tier: Manual backups only
- Use: `pg_dump` command to backup

---

## 🚨 Production Checklist

Before going live:
- [ ] Backend deployed and responding
- [ ] Frontend deployed and accessible
- [ ] Database connected and seeded
- [ ] Admin login working
- [ ] User registration working
- [ ] Payment QR page displays
- [ ] Withdrawal page accessible
- [ ] Admin panel functional

---

## 📞 Support

For deployment issues:
- **Railway Support**: [docs.railway.app](https://docs.railway.app)
- **Render Support**: [render.com/docs](https://render.com/docs)
- **Vercel Support**: [vercel.com/docs](https://vercel.com/docs)

---

## 🎉 You're Deployed!

After successful deployment:
1. **Frontend**: `https://your-project.vercel.app`
2. **Backend API**: `https://your-backend.railway.app/api`
3. **Admin Panel**: `https://your-project.vercel.app/admin/login`

**Test flow**:
1. Register new user
2. Log in with credentials
3. Select investment package
4. Upload payment proof
5. Wait for admin approval
6. Access dashboard and watch videos
