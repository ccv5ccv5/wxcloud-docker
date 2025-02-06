# WxCloud CLI Docker Image

这是一个用于运行微信云开发命令行工具 (@wxcloud/cli) 的 Docker 镜像。该镜像基于 Node.js 16 Alpine 版本构建，体积小巧，适合在 CI/CD 环境中使用。

## 功能特点

- 基于轻量级 Node.js 16 Alpine 镜像
- 预装 @wxcloud/cli 工具
- 支持执行单个或多个命令
- 适合 CI/CD 流程集成

## 使用方法

### 构建镜像

```bash
docker build -t wxcloud-cli-image .
```

### 基本用法

1. 运行默认命令（wxcloud）：
```bash
docker run --rm wxcloud-cli-image
```

2. 查看帮助信息：
```bash
docker run --rm wxcloud-cli-image -c "wxcloud --help"
```

3. 执行登录：
```bash
docker run --rm wxcloud-cli-image -c "wxcloud login"
```

### 执行多个命令

您可以使用 `&&` 连接多个命令：

```bash
docker run --rm wxcloud-cli-image -c "wxcloud login && wxcloud deploy"
```

## 注意事项

- 使用前请确保已获取微信云开发的相关权限和配置
- 在 CI/CD 环境中使用时，请妥善保管和配置相关密钥