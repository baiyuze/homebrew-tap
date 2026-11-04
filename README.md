# Homebrew tap for PasteFerry

Install the official [PasteFerry](https://pasteferry.cc/) Mac app with Homebrew.
The cask downloads the signed universal DMG from the
[PasteFerry releases](https://github.com/baiyuze/pasteferry/releases).
It supports Apple silicon and Intel Macs running macOS 13 or later.

## Install

```sh
brew tap baiyuze/tap
brew install --cask baiyuze/tap/pasteferry
```

Open PasteFerry after installation, enable background sync, and grant the
permissions requested by macOS. The app manages its own background service.

The app's bundled `pasteferry-cli` is also linked into Homebrew's `bin`
directory. It controls the same background service and uses the same device
identity, settings, pairing relationships, and clipboard history as the app.
The commands available depend on the installed PasteFerry release.

If you already installed PasteFerry manually, quit it and move the existing
`PasteFerry.app` out of `/Applications` before installing through Homebrew.
Keep your application data to preserve settings, pairings, and history.

## Update

PasteFerry supports in-app updates. To update it explicitly through Homebrew:

```sh
brew update
brew upgrade --cask --greedy baiyuze/tap/pasteferry
```

`--greedy` includes apps that can update themselves. Homebrew updates become
available after this tap's cask version and checksum have been updated.

## Uninstall

```sh
brew uninstall --cask baiyuze/tap/pasteferry
```

Uninstalling stops the PasteFerry daemon and quick-paste services, removes
their LaunchAgent registrations, and removes the app and CLI link.
Application data, pairings, settings, and history are preserved. This cask
does not define a `zap` step that deletes user data.

## Maintain the cask

After publishing an official PasteFerry release:

1. Update `version` in `Casks/pasteferry.rb`.
2. Download that release's `PasteFerry.dmg`, calculate its SHA-256, and check
   it against the release's `SHA256SUMS`. Update `sha256` in the cask.
3. Run the checks below, commit the change, and push it to this repository.

```sh
brew style Casks/pasteferry.rb
brew audit --cask --online baiyuze/tap/pasteferry
brew livecheck --cask baiyuze/tap/pasteferry
```

The cask uses existing PasteFerry release assets. App signing and release
packaging remain in the [main repository](https://github.com/baiyuze/pasteferry).

## 中文安装说明

本仓库提供官方 Mac 桌面版的 Homebrew 安装入口，支持 macOS 13 及以上版本、
Apple 芯片和 Intel 芯片。安装命令见上方 Install，升级命令见 Update。

首次安装后打开 PasteFerry，启用后台同步并按提示授予系统权限。
同时提供 App 内置的 `pasteferry-cli` 命令，它与桌面版共用后台服务和数据。
已有手动安装的 App 时，先退出并移走 `/Applications/PasteFerry.app`，
保留应用数据，然后执行 Homebrew 安装。卸载会移除程序和后台服务注册，保留用户数据。
