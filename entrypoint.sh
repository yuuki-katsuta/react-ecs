#!/bin/sh

# env-config.jsファイルのパス
ENV_CONFIG_FILE="/usr/share/nginx/html/env-config.js"

# 環境変数を読み取ってenv-config.jsを生成
cat <<EOF > $ENV_CONFIG_FILE
const config = Object.freeze({
  SAMPLE_KEY: '${SAMPLE_KEY:-}',
})

Object.defineProperty(window, "env", {
  value:config,
  writable: false,
  configurable: false
})
EOF

echo "環境変数を注入しました:"
cat $ENV_CONFIG_FILE

# デフォルトコマンド（CMD）を実行
exec "$@"
