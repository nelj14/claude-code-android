# Online APK Build Options

## 1. GitHub Actions (Free)
- Push your code to GitHub
- The workflow will automatically build APK
- Download from Actions tab

## 2. Appetize.io
- Upload your web app
- Test in browser before building

## 3. PhoneGap Build (Adobe)
- Upload project ZIP
- Builds APK online

## 4. Ionic Appflow
- Similar to PhoneGap
- Good for Capacitor projects

## Quick Setup for GitHub:

```bash
# Initialize git repo
git init
git add .
git commit -m "Initial Claude Code APK setup"

# Create GitHub repo and push
git remote add origin https://github.com/yourusername/claude-code-android
git push -u origin main
```

The GitHub Action will automatically build your APK!