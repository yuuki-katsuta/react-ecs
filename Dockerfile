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

# ポート80を公開
EXPOSE 80

# Nginxをフォアグラウンドで起動
CMD ["nginx", "-g", "daemon off;"]
