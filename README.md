# WxCloud CLI Docker Image

这是一个用于运行微信云开发命令行工具 (@wxcloud/cli) 的 Docker 镜像。该镜像基于 Node.js 16 Alpine 版本构建，体积小巧，适合在 CI/CD 环境中使用。

## 功能特点

- 基于轻量级 Node.js 16 Alpine 镜像
- 预装 @wxcloud/cli 工具
- 支持执行单个或多个命令
- 适合 CI/CD 流程集成
- 支持 Docker Hub 自动构建和缓存优化

## 使用方法

### 从 Docker Hub 拉取镜像

```bash
docker pull qq406877924/wxcloud-cli-image:latest
```

### 基本用法

1. 运行默认命令（wxcloud）：
```bash
docker run --rm qq406877924/wxcloud-cli-image
```

2. 查看帮助信息：
```bash
docker run --rm qq406877924/wxcloud-cli-image -c "wxcloud --help"
```

3. 执行登录：
```bash
docker run --rm -it qq406877924/wxcloud-cli-image -c "wxcloud login"
```

### 高级用法

1. 挂载本地目录：
```bash
docker run --rm -v $(pwd):/app qq406877924/wxcloud-cli-image -c "wxcloud deploy"
```

2. 使用环境变量：
```bash
docker run --rm -e WXCLOUD_APPID=your_appid qq406877924/wxcloud-cli-image -c "wxcloud deploy"
```

3. 执行多个命令：
```bash
docker run --rm qq406877924/wxcloud-cli-image -c "wxcloud login && wxcloud deploy"
```

### CI/CD 集成示例

1. GitHub Actions 中使用：
```yaml
steps:
  - name: Deploy to WxCloud
    uses: docker://qq406877924/wxcloud-cli-image:latest
    with:
      args: wxcloud deploy
    env:
      WXCLOUD_APPID: ${{ secrets.WXCLOUD_APPID }}
```

## 版本说明

- `latest`: 最新版本
- `${commit-sha}`: 特定提交对应的版本
- `buildcache`: 构建缓存标签（不要直接使用）

## 注意事项

- 使用前请确保已获取微信云开发的相关权限和配置
- 在 CI/CD 环境中使用时，请妥善保管和配置相关密钥
- 建议使用 `-v` 参数挂载本地目录，以确保能够正确访问项目文件
- 如需交互式操作（如登录），请添加 `-it` 参数
- 在生产环境中，建议使用特定的提交 SHA 版本，而不是 `latest` 标签

## 自行构建

如果你需要自定义镜像，可以克隆本仓库并自行构建：

```bash
docker build -t wxcloud-cli-image .
```

## 问题反馈

如果在使用过程中遇到任何问题，欢迎在 GitHub Issues 中反馈。