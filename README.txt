# 家族カレンダー v1

## できること
- 家族4人の予定を1つの月間カレンダーで共有
- iPhone / Android / PC対応
- 日付タップで予定追加
- 予定の編集・削除
- 家族4人を色分け
- 各端末ごとに「自分」を初期選択
- Supabase Realtimeで他端末の変更を反映
- PWA対応（ホーム画面追加）

## 初回設定
1. SupabaseのSQL Editorで `supabase-v1.sql` を実行
2. GitHub Pages等に `index.html` / `manifest.webmanifest` / `sw.js` をアップロード
3. アプリの「設定」を開く
4. Supabase Project URL と anon public key を入力
5. 家族名を必要に応じて変更
6. 保存して接続

## 注意
v1は家族内限定の簡易共有仕様です。
RLSはanonユーザーに読み書きを許可しているため、URLとanon keyが第三者に漏れない前提です。
次の版で「家族コード/ログイン」を追加すると安全性を高められます。
