# 环境变量配置说明

## 必需的环境变量

在Zeabur中设置以下环境变量：

### 1. OpenAI/OpenRouter配置
```bash
OPENAI_API_KEY=your_openai_api_key_here
BIG_MODEL_NAME=anthropic/claude-3-5-sonnet-20241022
SMALL_MODEL_NAME=anthropic/claude-3-haiku-20240307
```

### 2. 可选配置
```bash
# API基础URL (默认: https://openrouter.ai/api/v1)
BASE_URL=https://openrouter.ai/api/v1

# Bearer Token认证 (留空则禁用认证)
AUTH_TOKEN=your_secret_bearer_token

# 服务器配置 (通常使用默认值)
HOST=0.0.0.0
PORT=8080

# 日志配置
LOG_LEVEL=INFO
LOG_FILE_PATH=log.jsonl

# 应用配置
REFERRER_URL=http://localhost:8080/claude_proxy
```

## 环境变量对应关系

| 环境变量名 | Python字段名 | 说明 |
|-----------|------------|-----|
| `OPENAI_API_KEY` | `openai_api_key` | OpenRouter API密钥 |
| `BIG_MODEL_NAME` | `big_model_name` | 大模型名称 (Opus/Sonnet) |
| `SMALL_MODEL_NAME` | `small_model_name` | 小模型名称 (Haiku) |
| `BASE_URL` | `base_url` | API基础URL |
| `AUTH_TOKEN` | `auth_token` | Bearer认证令牌 |
| `HOST` | `host` | 监听主机 |
| `PORT` | `port` | 监听端口 |
| `LOG_LEVEL` | `log_level` | 日志级别 |
| `LOG_FILE_PATH` | `log_file_path` | 日志文件路径 |
| `REFERRER_URL` | `referrer_url` | HTTP Referer头 |

## 使用示例

### 本地开发 (.env文件)
```bash
OPENAI_API_KEY=sk-or-v1-xxxxx
BIG_MODEL_NAME=anthropic/claude-3-5-sonnet-20241022
SMALL_MODEL_NAME=anthropic/claude-3-haiku-20240307
AUTH_TOKEN=my-secret-token-123
```

### Zeabur平台
在Zeabur控制台的"环境变量"页面中设置上述变量。

## 验证配置

应用启动时会：
1. ✅ 验证必需的环境变量是否存在
2. 🔍 显示加载的配置信息（隐藏敏感信息）
3. ❌ 如果缺少必需变量会退出并提示

## API使用示例

### 无认证
```bash
curl -X POST http://your-app.zeabur.app/v1/messages \
  -H "Content-Type: application/json" \
  -d '{
    "model": "claude-3-haiku",
    "max_tokens": 100,
    "messages": [{"role": "user", "content": "Hello!"}]
  }'
```

### 带Bearer认证
```bash
curl -X POST http://your-app.zeabur.app/v1/messages \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your_secret_bearer_token" \
  -d '{
    "model": "claude-3-haiku", 
    "max_tokens": 100,
    "messages": [{"role": "user", "content": "Hello!"}]
  }'
``` 