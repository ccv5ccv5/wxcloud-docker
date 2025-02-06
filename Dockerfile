# 使用官方轻量版 Node 镜像作为基础镜像
FROM node:16-alpine

# 全局安装 @wxcloud/cli
RUN npm install -g @wxcloud/cli

# 声明镜像暴露的端口（如果 @wxcloud/cli 需要监听端口，可设置）
# EXPOSE 3000

# 设置入口点和默认命令
ENTRYPOINT ["/bin/sh"]
CMD ["-c", "wxcloud"]