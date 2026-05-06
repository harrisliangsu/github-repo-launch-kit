# oss-launch-kit

> 一个 Claude Code skill：把 GitHub 仓库从「写完了」推到「能被陌生人 star」的标准流程。

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Skill: oss-launch-kit](https://img.shields.io/badge/skill-oss--launch--kit-purple.svg)](SKILL.md)
[![Platform: macOS | Linux](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-lightgrey.svg)](#dependencies)

## 这是什么

把开源仓库冷启动这件事拆成 4 个阶段：

1. **上架前的信任信号包**（陌生人停留 3 秒）—— badge / CONTRIBUTING / topics / Discussions / Issue 模板
2. **仓库本身的差异化**（值不值得 star）—— 30 秒能跑、对比表、踩坑笔记
3. **冷启动传播**（第一波 100 stars）—— HN / Reddit / 即刻 / 朋友圈 / awesome-list
4. **持续运营**（让仓库活着）—— CI / 发版 / Discussions / 月报

每一项都标了 **AI 直接能做** vs **必须人工做**，避免把不该自动化的事自动化（比如真人账号发帖、上传 social preview 图）。

## 安装

```bash
git clone <this-repo> ~/Dev/repo/oss-launch-kit
~/Dev/repo/oss-launch-kit/install.sh
```

`install.sh` 会把仓库软链到 `~/.claude/skills/oss-launch-kit`，Claude Code 自动发现。

## 在 Claude Code 里怎么用

下次开会话说任一句即可触发：

- 让仓库火 / 让 github 项目更受欢迎
- github 冷启动 / 上架前清单 / 开源运营
- 我刚开源了一个仓库，下一步做什么
- make my repo popular / launch open source project / OSS launch checklist

Claude 会先勘查仓库现状（description / topics / Discussions / README badge / CONTRIBUTING 是否存在），判断你处在 4 个阶段中的哪一段，再给出对应建议。

## 一键脚本

阶段 1 里 AI 能做的事可以一次跑掉：

```bash
cd <你的目标仓库>
~/.claude/skills/oss-launch-kit/scripts/apply-stage1.sh \
    --repo owner/repo \
    --description "Hands-on …" \
    --topics "llm,fine-tuning,lora" \
    --enable-discussions \
    --apply
```

不加 `--apply` 是 dry-run，先看会做什么。脚本不覆盖已有文件，不动 README（README 第一屏由用户决定）。

## 目录结构

```
oss-launch-kit/
├── SKILL.md                          # Claude 加载的主文件（frontmatter + 流程）
├── README.md                         # 你正在看的这个
├── LICENSE                           # MIT
├── install.sh                        # 软链到 ~/.claude/skills/
├── scripts/
│   └── apply-stage1.sh               # 阶段 1 一键执行
└── templates/
    ├── README-badges.md              # README badge 片段集合
    ├── CONTRIBUTING.md
    ├── CODE_OF_CONDUCT.md
    ├── CHANGELOG.md
    ├── PULL_REQUEST_TEMPLATE.md
    ├── ISSUE_TEMPLATE/
    │   ├── bug_report.md
    │   ├── feature_request.md
    │   └── question.md
    ├── workflows/
    │   └── ci-minimal.yml
    └── launch-post.md                # 引爆文骨架
```

## 不要做的事

- 刷 star / 自动化转发 —— GitHub 反作弊会降权
- README 顶部放红 CI badge —— 比没有还糟
- 让 Claude 用你的账号在 HN / Reddit / X 发帖 —— 平台对 bot 敏感，掉号风险高
- 替用户决定 tagline / 引爆文叙事 —— 那是真实声音，不是合成内容

## License

[MIT](LICENSE)
