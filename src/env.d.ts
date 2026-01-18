// 実行時環境変数の型定義
interface RuntimeEnv {
  SAMPLE_KEY?: string;
}

declare global {
  interface Window {
    env?: RuntimeEnv;
  }
}

export {};
