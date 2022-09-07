# 基于node14-alpine 安装nginx + 打包文件
FROM node:14-alpine

# 设置环境变量
ENV PROJECT_ENV production
ENV NODE_ENV production

# 安装nginx
RUN apt-get update && apt-get install -y nginx

# 选择更小体积的基础镜像
FROM nginx:alpine

# 把所有源代码拷贝到/app
COPY . /app

# 切换到app目录
WORKDIR /app

# 拷贝配置文件到nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

# 启动nginx，关闭守护式运行，否则容器启动后会立刻关闭
CMD ["nginx", "-g", "daemon off;"]