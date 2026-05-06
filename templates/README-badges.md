# README Badge 片段

复制需要的几行，贴在 README 第一行（标题）下方。

## 通用四件套

```markdown
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Python 3.10+](https://img.shields.io/badge/python-3.10%2B-yellow.svg)](requirements.txt)
[![Platform: macOS | Linux](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-lightgrey.svg)](#dependencies)
[![CI](https://github.com/<owner>/<repo>/actions/workflows/ci.yml/badge.svg)](https://github.com/<owner>/<repo>/actions/workflows/ci.yml)
```

## 按语言切换

### Python

```markdown
[![Python 3.10+](https://img.shields.io/badge/python-3.10%2B-yellow.svg)](requirements.txt)
```

### Bash

```markdown
[![bash 3.2+](https://img.shields.io/badge/bash-3.2%2B-yellow.svg)](#dependencies)
```

### Node

```markdown
[![Node 20+](https://img.shields.io/badge/node-20%2B-green.svg)](package.json)
```

### Go

```markdown
[![Go 1.22+](https://img.shields.io/badge/go-1.22%2B-blue.svg)](go.mod)
```

### Rust

```markdown
[![Rust 1.75+](https://img.shields.io/badge/rust-1.75%2B-orange.svg)](Cargo.toml)
```

## 项目自定义指标

可以加上让仓库一眼可量化的 badge：

```markdown
[![Lessons: 10](https://img.shields.io/badge/lessons-10-brightgreen.svg)](lessons/README.md)
[![Models: 5](https://img.shields.io/badge/models-5-brightgreen.svg)](models/README.md)
[![Examples: 20](https://img.shields.io/badge/examples-20-brightgreen.svg)](examples/README.md)
```

## 动态 badge（自动跟仓库状态变化）

```markdown
[![Stars](https://img.shields.io/github/stars/<owner>/<repo>?style=social)](https://github.com/<owner>/<repo>/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/<owner>/<repo>)](https://github.com/<owner>/<repo>/commits)
[![Issues](https://img.shields.io/github/issues/<owner>/<repo>)](https://github.com/<owner>/<repo>/issues)
[![Release](https://img.shields.io/github/v/release/<owner>/<repo>)](https://github.com/<owner>/<repo>/releases)
```

> 早期仓库不要放 stars badge —— 数字小反而是负信号。100 stars 之后再加。

## 头部链接条（badge 下一行）

```markdown
> <一句话 tagline>
> [English](README.en.md) · [中文](README.zh.md) · [Discussions](https://github.com/<owner>/<repo>/discussions) · [Issues](https://github.com/<owner>/<repo>/issues)
```

## 检查清单

- [ ] License badge 链接到 LICENSE 文件
- [ ] CI badge 仅在 CI 真的跑且通过时才放（红的 badge 比没有更糟）
- [ ] 中英文 README 都同步加 badge
- [ ] badge 总数 ≤6，超过会显得花哨
