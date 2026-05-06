#!/usr/bin/env bash
# 把 oss-launch-kit 软链到 ~/.claude/skills/，让 Claude Code 全局可用。
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="${HOME}/.claude/skills/oss-launch-kit"

mkdir -p "${HOME}/.claude/skills"
ln -sfn "$SRC" "$DEST"
chmod +x "$SRC/scripts/apply-stage1.sh" 2>/dev/null || true

echo "已安装：$DEST -> $SRC"
echo "在新的 Claude Code 会话里说「让仓库火 / oss launch / 上架前清单」即可触发。"
