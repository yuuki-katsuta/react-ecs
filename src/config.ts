// 実行時環境変数とビルド時環境変数を統合するヘルパー
// 優先順位: window.env（実行時） > import.meta.env（ビルド時）

export const config = {
  SAMPLE_KEY: window.env?.SAMPLE_KEY || '',
} as const;
