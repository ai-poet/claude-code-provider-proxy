FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# 复制项目文件
COPY pyproject.toml uv.lock ./
COPY src/ ./src/
COPY start.sh ./

# 安装uv
RUN pip install uv

# 使用uv安装依赖
RUN uv sync --frozen

# 复制main.py到根目录（兼容Zeabur的默认启动路径）
RUN cp src/main.py main.py

# 设置启动脚本权限
RUN chmod +x start.sh

# 暴露端口
EXPOSE 8080

# 设置环境变量
ENV PYTHONPATH=/app
ENV HOST=0.0.0.0
ENV PORT=8080

# 启动命令
CMD ["bash", "start.sh"] 