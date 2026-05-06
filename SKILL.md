---
name: oss-launch-kit
description: |
  开源仓库冷启动与传播工具包。把一个 GitHub 仓库从「写完了」推到「能被陌生人 star」，
  四阶段流程：上架前信任信号 → 差异化打磨 → 冷启动传播 → 持续运营。明确区分
  AI 直接能做的部分和必须人工做的部分。Use when asked to "让仓库火"、
  "怎么让 github 项目更受欢迎"、"开源项目运营"、"github 冷启动"、"上架前清单"、
  "make my repo popular"、"launch open source project"、"open source go-to-market"、
  "OSS launch checklist". 也在用户刚 push 完一个新公开仓库、问「接下来该做什么」时主动建议。
version: 0.1.0
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - Glob
  - Grep
---

# OSS Launch Kit

把一个 GitHub 仓库从「代码写完」推到「陌生人愿意 star」的标准操作流程。

## 何时使用

用户问以下任一类问题，立即用本 skill：

- 「这个项目怎么才能火 / 让更多人用」
- 「github 冷启动 / 开源运营 / 上架前要做什么」
- 「我刚开源了一个仓库，下一步做什么」
- 「为什么我的 repo 没人 star」
- 「参考某某项目，给我做同样的运营动作」

如果用户在一个 git 仓库里、刚完成一次较大功能或文档提交，且仓库还很冷清（少 star、无 description、无 topics、无 CONTRIBUTING），可以**主动**建议跑这个 skill。

## 一句话心智模型

> 「让陌生人在 30 秒内决定要不要 star」决定首屏；「让搜索能搜到你」决定流量；
> 「让点进来的人觉得活着」决定留存；「让一群朋友替你转发」决定第一波 100 stars。
> 四件事缺一不可，但顺序不能反。

## 四阶段流程

### 阶段 1：上架前的信任信号包（陌生人停留 3 秒）

**目标**：进来的人不退出。

| 项 | 谁做 |
|---|---|
| LICENSE 选 MIT/Apache-2.0 | AI |
| README badge 排（License / 语言版本 / Platform / CI / 关键指标） | AI |
| README tagline（一句话讲清「我帮谁解决什么具体痛点」） | AI 起草，人工拍板 |
| README 头部链接条（Docs · Discussions · Issues · 中英切换） | AI |
| 双语 README（README.md + README.zh.md / .en.md） | AI |
| 首屏视觉（截图 / GIF / 录屏） | AI 写 markdown，**人工录屏** |
| CONTRIBUTING.md（一句话原则 + 本地校验 + PR checklist + bug 模板） | AI |
| CHANGELOG.md（Keep a Changelog 风格） | AI |
| VERSION 文件 / 脚本 header 内嵌 repo URL + version | AI |
| .gitignore / .editorconfig | AI |
| Issue / PR / Discussion 模板（.github/ISSUE_TEMPLATE/） | AI |
| Code of Conduct（Contributor Covenant） | AI |
| GitHub topics（≤20 个） | AI（`gh repo edit --add-topic`） |
| About description（英文一句话） | AI |
| Discussions 启用 | AI（`gh repo edit --enable-discussions=true`） |
| Repository social preview 图（1280×640） | **人工**（GitHub 这个 API 没开放） |

**一键脚本**：`scripts/apply-stage1.sh <owner/repo>` —— 干完所有 AI 能干的部分（详见下方）。

### 阶段 2：仓库本身的差异化（值不值得 star）

**目标**：进来的人觉得「这个不一样」。

| 项 | 谁做 |
|---|---|
| 30 秒能跑（`bootstrap.sh` / `make demo` 一行命令出可见效果） | AI |
| 依赖分层（`requirements-core` / `requirements-train`） | AI |
| 「我和 X / Y / Z 的区别」对比表 | AI 起草 / 人工确认对比对象 |
| 例子可独立运行（每个 example 有自己的 README + 跑通命令） | AI |
| 一份「踩坑笔记」长文 | AI 草稿 / 人工注入个人故事和数据 |
| GitHub Pages / 静态文档站 | AI |
| 每个文档页加 OG 分享卡（`<meta property="og:image">`) | AI |

### 阶段 3：冷启动传播（第一波 100 stars）

**目标**：让仓库被外部世界发现。

| 项 | 谁做 |
|---|---|
| 写一篇引爆文（讲「我遇到什么问题、踩了什么坑、于是有了这个」） | AI 起草 / **人工注入真实经历** |
| Hacker News（Show HN, 周二/周三 美西早 8-10 点） | **人工** |
| Reddit（r/MachineLearning / r/LocalLLaMA / 等相关 subreddit） | **人工** |
| X / Twitter（带 GIF + repo 链接 + @ KOL） | **人工** |
| 即刻 / V2EX / 小红书 / 知乎 | **人工** |
| dev.to / Medium 长文同步发布 | **混合**（AI 改格式 / 人工发） |
| 给相关 awesome-list 提 PR 加自己 | AI 写 PR / 人工确认相关性 |
| 找朋友 / 同事第一波 star（避免 bot star，会被 GitHub 降权） | **人工** |
| 联系相关 KOL 转发（邮件 / DM） | **人工** |
| 在自己常驻的 Discord / 社群发（不刷屏） | **人工** |

### 阶段 4：持续运营（让仓库「活着」）

**目标**：第一波之后，留下的人越来越多。

| 项 | 谁做 |
|---|---|
| CI workflow（`.github/workflows/ci.yml`，至少跑 lint + test） | AI |
| 每周一次小提交（绿格不能断） | AI |
| 24h 内回 issue / PR | 混合（AI 起草，人工确认语气） |
| 给 PR 作者打标签 / 鼓励第一次贡献者 | **人工** |
| 发版 + Release Notes（`gh release create`） | AI 创建 / 人工推社交 |
| 每月一篇 changelog 长文 | AI |
| 跟踪 trending / star 来源（`gh api /repos/.../traffic/popular/referrers`） | AI |
| 把 Discussions 高频问题沉淀到 README/FAQ | 混合 |
| 加新 feature 前在 Discussions 发 RFC 征求意见 | 混合 |
| 投稿 weekly newsletter（Python Weekly / TLDR / 中文周刊） | **人工** |
| 200+ stars 后开通 GitHub Sponsors | **人工**（绑卡） |

## AI 的真实边界

**AI 直接能做完（不需要打扰用户）**：
- 仓库内所有文件（README / CONTRIBUTING / CHANGELOG / templates / CI / docs / 双语翻译）
- `gh` CLI 覆盖的 GitHub API 操作（topics / description / discussions / releases / 给 awesome-list 提 PR）
- 静态站点部署、版本号管理、文档同步
- Release Notes 草稿、社交媒体文案草稿、长文草稿

**AI 做不了 / 不该替用户做**：
- 真人账号发帖（HN / Reddit / X / 知乎 / 即刻 / 小红书 / V2EX）—— 这些平台对 bot 异常敏感，掉号风险高，且涉及真实身份信誉
- 手机端录屏 / 视频剪辑 / 上传社交平台
- 找 KOL / 朋友冷启动（人际信任不能代理）
- Repository social preview 图上传（GitHub 这个 API 没开放）
- GitHub Sponsors 实名 + 绑卡
- 涉及个人经历 / 痛点叙事的真实部分（草稿可以写，但「这是不是真心话」只有用户能判断）
- 拍板项目方向（要不要加某个 feature、要不要做某个对比）

## 工作流（怎么用这个 skill）

第一步永远先**勘查现状**，再决定从哪一阶段切入：

```bash
# 1. 仓库元数据现状
gh repo view <owner/repo> --json description,repositoryTopics,hasDiscussionsEnabled,stargazerCount,forkCount

# 2. 仓库内文件现状
ls -la README* LICENSE CONTRIBUTING.md CHANGELOG.md .github/ 2>/dev/null

# 3. README 第一屏
head -30 README.md
```

按结果对照下表，告诉用户「你处在阶段 X，建议先做 A/B/C」：

| 现状 | 推荐切入 |
|---|---|
| 没有 description / topics / Discussions 没开 / README 没有 badge | 阶段 1（一键脚本能跑掉大半） |
| 阶段 1 齐了，但 README 没有 GIF、没有「30 秒能跑」命令 | 阶段 2 |
| 仓库本身已经能打动人，但还没传播 | 阶段 3（人工为主，AI 起草文案 + awesome-list PR） |
| 已经有第一波 stars，需要让仓库活着 | 阶段 4（CI + 发版 + 月报） |

## 一键脚本

`scripts/apply-stage1.sh <owner/repo>` —— 干掉阶段 1 所有 AI 能做的事：

- 在仓库根目录写入 README badge 排（如果还没有）
- 在仓库根目录写入 CONTRIBUTING.md（如果还没有）
- 写入 `.github/ISSUE_TEMPLATE/` 三件套（bug / feature / question）
- 写入 `.github/PULL_REQUEST_TEMPLATE.md`
- 写入最小 CI workflow（`.github/workflows/ci.yml`）
- 调 `gh repo edit` 批量设置 topics / description / 启用 Discussions

跑之前先 `cd` 到目标仓库目录，并把 description / topics 想清楚（脚本会问）。

## 模板文件索引

放在 `templates/` 下，可以按需拷贝或编辑后写入目标仓库：

| 模板 | 用途 |
|---|---|
| `templates/README-badges.md` | README 顶部 badge 片段（License / 语言 / Platform / CI / 自定义指标） |
| `templates/CONTRIBUTING.md` | 通用 CONTRIBUTING 模板（本地校验 + PR checklist + bug 模板） |
| `templates/CODE_OF_CONDUCT.md` | Contributor Covenant 模板 |
| `templates/CHANGELOG.md` | Keep a Changelog 起步模板 |
| `templates/ISSUE_TEMPLATE/bug_report.md` | Issue 模板：bug |
| `templates/ISSUE_TEMPLATE/feature_request.md` | Issue 模板：feature |
| `templates/ISSUE_TEMPLATE/question.md` | Issue 模板：引导去 Discussions |
| `templates/PULL_REQUEST_TEMPLATE.md` | PR 模板 |
| `templates/workflows/ci-minimal.yml` | 最小 CI（lint + test） |
| `templates/launch-post.md` | 引爆文骨架（problem → 踩坑 → 仓库） |

## 提交规范

应用本 skill 产生的所有变动建议作为**单独一次提交**，commit message 用 `claude-update` 同款：

```
docs: add badges, CONTRIBUTING.md, and version metadata

- README: <具体 badge 列表>; link to Discussions and Issues.
- CONTRIBUTING.md: <一句话原则>; PR checklist; bug template.
- <脚本路径>: embed repo URL and version <x.y.z> in header.
```

零代码风险、对外信号增益最大 —— 适合作为「上架前清单」单独成一次提交。

## 不要做的事

- **不要刷 star / 自动化转发**。GitHub 反作弊系统会降权，且会被识破。
- **不要在 README 第一屏放 CI badge 但 CI 是红的**（负信号比没 badge 更糟）。
- **不要在没人问的情况下自动给所有 awesome-list 提 PR**，先确认相关性。
- **不要替用户决定 tagline / 引爆文叙事**，那是用户的真实声音。
- **不要因为「让仓库看起来活跃」就乱加 commit**，绿格的代价是真实的工作。
