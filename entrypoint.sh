#!/bin/sh

# env-config.jsファイルのパス
ENV_CONFIG_FILE="/usr/share/nginx/html/env-config.js"

# 環境変数を読み取ってenv-config.jsを生成
cat <<EOF > $ENV_CONFIG_FILE
window.env = {
  SAMPLE_KEY: '${SAMPLE_KEY:-}',
};
EOF

echo "環境変数を注入しました:"
cat $ENV_CONFIG_FILE

# デフォルトコマンド（CMD）を実行
exec "$@"
