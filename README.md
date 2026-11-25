# Antigravity 一键汉化（Windows）

给 Google Antigravity 用的单文件一键汉化安装包。双击即完成安装、校验、创建快捷方式并启动汉化，无需命令行。

> 适用于 Windows 10/11 x64。需先安装 [Google Antigravity](https://antigravity.google/)。

## 下载

前往 [Releases](https://github.com/tomoe1-1/antigravity-one-click-zh/releases/latest) 下载：

| 文件 | 说明 |
| --- | --- |
| `Antigravity-OneClick-ZH.exe` | 单文件安装包，双击即用 |
| `Antigravity-OneClick-ZH.zip` | 同上，便于转发分发 |

## 使用方法

1. 先安装 Google Antigravity。
2. 双击 `Antigravity-OneClick-ZH.exe`。
3. 程序自动完成：检测安装 → 安装汉化组件 → SHA-256 校验 → 创建桌面「Antigravity 中文」快捷方式 → 启动汉化。

以后从桌面「**Antigravity 中文**」快捷方式启动即为中文界面。窗口右下角有一个半透明圆钮：

- 显示 `EN` 时单击 → 切换为中文
- 显示 `中` 时单击 → 切换为英文
- 双击 / 右键 → 选项菜单（可勾选「选项名保留英文」）
- 按住拖动 → 调整圆钮位置

## 恢复英文

运行 `%LOCALAPPDATA%\Antigravity-Hans\恢复英文.bat`，然后关闭 Antigravity，用原来的「Antigravity」快捷方式重新启动。

## 工作原理

- 汉化核心来自开源项目 [Antigravity-Hans](https://github.com/yuexps/Antigravity-Hans) v0.5.1，通过 CDP 动态翻译界面。
- 动态翻译**不修改 Antigravity 安装文件**，官方更新后依然可用。
- 安装包用 Windows 自带的 `iexpress` 制作成自解压单文件，内含安装脚本与汉化组件，安装时做 SHA-256 校验，校验不通过会中止。
- 上游适配版本为 Antigravity 2.34.0；本机 2.35.1 实测可用，个别新增文案可能仍显示英文。

## 文件校验

| 文件 | SHA-256 |
| --- | --- |
| 汉化组件 `antigravity-hans.exe` | `91e2987479334a3c001f7c0ab01d830f53b4a2389c7daf8faca56f5503e18bc1` |
| 安装包 `Antigravity-OneClick-ZH.exe` | `23748d2a6345cd0a5b679f1f72399b2c89ce0d0b401386b328ad000fff960d6c` |

> 部分杀毒软件可能对未签名程序误报，核对哈希一致后可放心放行。

## 仓库内容

- `src/` —— 一键安装脚本、恢复脚本与打包配置（可自行重建）
- 发行包二进制通过 Releases 分发，不入库

## 自行构建

在 `src/` 目录下执行（Windows 自带 iexpress）：

```bat
iexpress /q /c pack.sed
```

详细说明见 [src/BUILD.md](src/BUILD.md)。

## 许可与致谢

本仓库的封装脚本采用 [MIT](LICENSE)。汉化组件 Antigravity-Hans 版权归原作者所有，遵循其项目原有约定；本仓库只做封装与分发，不主张该组件的版权。

感谢 [yuexps/Antigravity-Hans](https://github.com/yuexps/Antigravity-Hans) 提供汉化核心。
