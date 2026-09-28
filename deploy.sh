#!/usr/bin/env bash
set -euo pipefail

# ═══════════════════════════════════════════════════════
#  Biopesticide Framework — GitHub Pages deploy script
#  Usage:  ./deploy.sh [git-repo-url]
# ═══════════════════════════════════════════════════════

echo "🌱 Deploying Biopesticide Framework to GitHub Pages…"

command -v git >/dev/null 2>&1 || { echo "❌ git is required"; exit 1; }

[ -d .git ] || git init
git add -A
git commit -m "Update biopesticide framework page" --allow-empty

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Build an orphan gh-pages branch from the working tree
git branch -D gh-pages 2>/dev/null || true
git checkout --orphan gh-pages
git add -A
git commit -m "GitHub Pages build" --allow-empty

REMOTE=$(git remote get-url origin 2>/dev/null || echo "")
if [ -z "$REMOTE" ]; then
  if [ -n "${1:-}" ]; then
    git remote add origin "$1"
    REMOTE="$1"
  else
    echo "❌ No remote. Run: git remote add origin <repo-url>"
    echo "   or:           ./deploy.sh <repo-url>"
    git checkout "$CURRENT_BRANCH"
    exit 1
  fi
fi

git push -f "$REMOTE" gh-pages:gh-pages
echo "✅ Pushed to gh-pages branch."
echo ""
echo "📌 Next: repo Settings → Pages → Source: 'Deploy from a branch'"
echo "         Branch: gh-pages  /  Folder: / (root)  →  Save"
echo "🔗 Live at: https://<username>.github.io/<repo>/"

git checkout "$CURRENT_BRANCH"
