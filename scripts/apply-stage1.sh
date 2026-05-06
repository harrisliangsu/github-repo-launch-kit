#!/usr/bin/env bash
# apply-stage1.sh — 干掉「上架前信任信号包」里 AI 能做的部分。
#
# 用法：
#   cd <目标仓库>
#   ~/.claude/skills/github-repo-launch-kit/scripts/apply-stage1.sh \
#       --repo owner/repo \
#       --description "Hands-on …" \
#       --topics "llm,fine-tuning,lora,peft,sft" \
#       [--enable-discussions] \
#       [--dry-run]
#
# 安全约定：
#   - 默认 dry-run，会打印「将做什么」，不写任何文件、不调 gh。
#   - 加 --apply 才真改东西。
#   - 已存在的文件**不覆盖**（CONTRIBUTING.md、CHANGELOG.md、LICENSE 等）。
#   - 不动 README.md（README badge 拼装由调用方按情况决定，避免误改第一屏）。

set -euo pipefail

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TEMPLATES="${SKILL_DIR}/templates"

REPO=""
DESCRIPTION=""
TOPICS=""
ENABLE_DISCUSSIONS=0
APPLY=0

usage() {
  sed -n '2,17p' "$0"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --repo) REPO="$2"; shift 2 ;;
    --description) DESCRIPTION="$2"; shift 2 ;;
    --topics) TOPICS="$2"; shift 2 ;;
    --enable-discussions) ENABLE_DISCUSSIONS=1; shift ;;
    --apply) APPLY=1; shift ;;
    --dry-run) APPLY=0; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "未知参数：$1"; usage; exit 1 ;;
  esac
done

ACTION="dry-run"
[[ $APPLY -eq 1 ]] && ACTION="apply"

echo "=== github-repo-launch-kit · stage 1 (${ACTION}) ==="
echo "repo:           ${REPO:-<未指定>}"
echo "description:    ${DESCRIPTION:-<未指定>}"
echo "topics:         ${TOPICS:-<未指定>}"
echo "discussions:    $([[ $ENABLE_DISCUSSIONS -eq 1 ]] && echo enable || echo skip)"
echo "templates from: $TEMPLATES"
echo

if [[ ! -d .git ]]; then
  echo "✗ 当前目录不是 git 仓库。先 cd 到目标仓库根目录。" >&2
  exit 1
fi

write_if_absent() {
  local src="$1" dst="$2"
  if [[ -e "$dst" ]]; then
    echo "  · skip $dst（已存在，不覆盖）"
    return
  fi
  if [[ $APPLY -eq 1 ]]; then
    mkdir -p "$(dirname "$dst")"
    cp "$src" "$dst"
    echo "  ✓ wrote $dst"
  else
    echo "  ⤷ would write $dst"
  fi
}

echo "[1/3] 写入文件（不覆盖已有）"

write_if_absent "$TEMPLATES/CONTRIBUTING.md"                 "CONTRIBUTING.md"
write_if_absent "$TEMPLATES/CODE_OF_CONDUCT.md"              "CODE_OF_CONDUCT.md"
write_if_absent "$TEMPLATES/CHANGELOG.md"                    "CHANGELOG.md"
write_if_absent "$TEMPLATES/PULL_REQUEST_TEMPLATE.md"        ".github/PULL_REQUEST_TEMPLATE.md"
write_if_absent "$TEMPLATES/ISSUE_TEMPLATE/bug_report.md"    ".github/ISSUE_TEMPLATE/bug_report.md"
write_if_absent "$TEMPLATES/ISSUE_TEMPLATE/feature_request.md" ".github/ISSUE_TEMPLATE/feature_request.md"
write_if_absent "$TEMPLATES/ISSUE_TEMPLATE/question.md"      ".github/ISSUE_TEMPLATE/question.md"
write_if_absent "$TEMPLATES/workflows/ci-minimal.yml"        ".github/workflows/ci.yml"

echo
echo "[2/3] GitHub 元数据（gh repo edit）"

if [[ -z "$REPO" ]]; then
  echo "  · skip（没有 --repo）"
else
  GH_ARGS=(repo edit "$REPO")
  [[ -n "$DESCRIPTION" ]] && GH_ARGS+=(--description "$DESCRIPTION")
  if [[ -n "$TOPICS" ]]; then
    IFS=',' read -ra TOPIC_ARR <<<"$TOPICS"
    for t in "${TOPIC_ARR[@]}"; do
      t="${t// /}"
      [[ -n "$t" ]] && GH_ARGS+=(--add-topic "$t")
    done
  fi
  [[ $ENABLE_DISCUSSIONS -eq 1 ]] && GH_ARGS+=(--enable-discussions=true)

  if [[ $APPLY -eq 1 ]]; then
    if ! command -v gh >/dev/null; then
      echo "  ✗ 需要 gh CLI（brew install gh）" >&2
      exit 1
    fi
    echo "  → gh ${GH_ARGS[*]}"
    gh "${GH_ARGS[@]}"
    echo "  ✓ done"
  else
    echo "  ⤷ would run: gh ${GH_ARGS[*]}"
  fi
fi

echo
echo "[3/3] 待人工处理"
echo "  · README 顶部 badge 排（参考 templates/README-badges.md）—— 改 README 这件事不自动跑，避免误伤"
echo "  · README 首屏 GIF / 截图 —— 你录"
echo "  · Repository social preview 图 —— 你在 Settings → Social preview 上传"
echo "  · 引爆文 —— 参考 templates/launch-post.md"
echo
[[ $APPLY -eq 0 ]] && echo "（这是 dry-run，加 --apply 真正落盘和调 gh）"
