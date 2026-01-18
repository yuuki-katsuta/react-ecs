# ビルドステージ
FROM node:20-alpine AS builder

WORKDIR /app

# 依存関係をコピーしてインストール
COPY package*.json ./
RUN npm install

# アプリケーションのソースコードをコピー
COPY . .

# プロダクションビルドを実行
RUN npm run build

# ランタイムステージ
FROM nginx:alpine

# ビルド成果物をNginxの公開ディレクトリにコピー
COPY --from=builder /app/dist /usr/share/nginx/html

# entrypoint.shをコピー
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# ポート80を公開
EXPOSE 80

# entrypoint.shを使用してNginxを起動
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
