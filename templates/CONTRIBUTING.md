# Contributing

谢谢你愿意花时间。本项目一个原则：**<一句话核心约束>**。

> 例：「prove it works on bash 3.2 (macOS) and bash 5+ (Linux)」
> 例：「任何改动都要在 macOS（Apple Silicon）和普通 Linux 开发机上能跑通」
> 例：「所有公开 API 都要有测试」

## 本地校验

```bash
# 三行能跑通的最小校验，按项目实际情况替换
<install-deps>                # 装依赖
<lint>                        # 语法 / 格式
<test>                        # 测试
```

## PR checklist

- [ ] 本地校验全部通过
- [ ] 涉及行为变化的改动有测试覆盖
- [ ] 文档（README / docs）和代码同步更新
- [ ] 一次提交一个独立改动，subject 用祈使句
- [ ] 双语 README 同步（如果项目维护双语）

## 报 bug

提一个 issue，附上：

- 操作系统 + 芯片 / 架构
- 运行时版本（如 `python --version` / `node --version` / `bash --version`）
- 关键依赖版本（如 `pip list | grep -E '<key-deps>'`）
- 你跑的完整命令和完整输出（包含 traceback）

最小复现路径越短越好。

## 想法 / 讨论 / 选型问题

优先去 [Discussions](https://github.com/<owner>/<repo>/discussions)，而不是 issue。
issue 留给「这是个 bug」或「我打算做这个 feature」。

## 行为准则

参与本项目即代表你同意遵守 [Code of Conduct](CODE_OF_CONDUCT.md)。
