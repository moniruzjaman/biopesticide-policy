# 🌱 Biopesticide Transition Framework — Bangladesh

A standalone policy-brief web page with **download**, **translation**, **share**, and
**text-to-speech** features.

## Features
| Feature | How it works |
|---|---|
| 💾 Download | Save the page as HTML or export as PDF (print) |
| 🌐 Translate | 8 languages via MyMemory API (বাংলা, हिन्दी, العربية, 中文, + more), cached locally |
| 🔗 Share | Web Share API, X/Facebook/LinkedIn, QR code, copy link |
| 🔊 Listen | Web Speech API reads any section or the whole document |
| 🌙 Dark mode | Toggle in header |

## Deploy to GitHub Pages (pick ONE method)

### Method A — Automatic (recommended)
1. Create a new GitHub repo.
2. Push all files, keeping `.github/workflows/deploy.yml`.
3. Repo **Settings → Pages → Source: “GitHub Actions”**.
4. Every `git push` to `main` auto-deploys. ✅

### Method B — One-command script
```bash
chmod +x deploy.sh
./deploy.sh https://github.com/YOUR_USER/YOUR_REPO.git
```
Then set **Settings → Pages → Branch: `gh-pages`**.

### Method C — No code, just UI
Upload `index.html` to a repo, then **Settings → Pages → Branch: main / root**.

> Site URL: `https://<username>.github.io/<repo>/`

## Notes
- Download, TTS, dark mode work **offline**. Translation & QR need internet.
- Rename the file to `index.html` before deploying.
