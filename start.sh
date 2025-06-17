#!/bin/bash

# 设置默认值
export HOST=${HOST:-"0.0.0.0"}
export PORT=${PORT:-8080}

# 启动应用
exec .venv/bin/python main.py 