# Contributing

谢谢你愿意花时间。本项目一个原则：**AI 能做和必须人工做的事必须分开标注**——
任何让 Claude 替用户在真人平台（HN / Reddit / X / 即刻）发帖、刷 star、伪造声音的
改动都不会被合入。

## 本地校验

```bash
bash -n install.sh scripts/*.sh   # bash 语法
shellcheck install.sh scripts/*.sh # shell lint（CI 上 Linux runner 跑）
bash scripts/apply-stage1.sh --help # 脚本能正常打印帮助
```

## PR checklist

- [ ] 本地 `bash -n` / `shellcheck` 通过
- [ ] 改动涉及 SKILL.md 的，frontmatter 仍然合法（`name` / `description` 两字段必备）
- [ ] 新增模板放到 `templates/`，并在 `apply-stage1.sh` 里登记（如果该跑）
- [ ] 一次提交一个独立改动，subject 用祈使句

## 报 bug

提一个 issue，附上：

- 操作系统 + 芯片 / 架构
- `bash --version`
- `gh --version`（如果涉及 `gh repo edit`）
- 完整命令和完整输出

## 想法 / 讨论 / 选型问题

优先去 [Discussions](https://github.com/harrisliangsu/github-repo-launch-kit/discussions)，
issue 留给「这是个 bug」或「我打算做这个 feature」。

## 行为准则

参与本项目即代表你同意遵守 [Code of Conduct](CODE_OF_CONDUCT.md)。
