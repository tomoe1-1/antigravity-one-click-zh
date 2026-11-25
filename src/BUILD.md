# 构建说明

## 准备

1. 从 [Antigravity-Hans Releases](https://github.com/yuexps/Antigravity-Hans/releases) 下载 `antigravity-hans-windows-amd64.exe`（当前使用 v0.5.1）及 `SHA256SUMS`。
2. 将两个文件放到本目录，并核对 `SHA256SUMS` 与实际文件哈希一致。
3. 若更换了组件版本，同步修改 `install.bat` 中的 `EXPECTED` 常量为新哈希。

## 打包

在 Windows 命令提示符下执行：

```bat
cd src
iexpress /q /c pack.sed
```

生成的 `setup.exe` 即为单文件安装包，重命名为 `Antigravity一键汉化.exe` 后即可分发。`iexpress` 为 Windows 自带工具，无需额外安装。

## 文件说明

| 文件 | 作用 |
| --- | --- |
| `install.bat` | 安装主脚本：检测 → 安装 → 校验 → 创建快捷方式 → 启动汉化 |
| `restore.bat` | 恢复英文脚本：结束监视器并移除中文快捷方式 |
| `readme.txt` | 随组件安装到用户目录的说明文件 |
| `pack.sed` | iexpress 自解压包配置 |

## 校验

构建后可用 `certutil -hashfile Antigravity一键汉化.exe SHA256` 核对哈希，并与 README 中记录值比对。
