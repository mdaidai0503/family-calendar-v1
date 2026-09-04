家族カレンダー v2.9.3 iPhoneホーム画面 接続設定引継ぎ修正版

今回の重要修正
1. QRで開いた「family_setup付きURL」をSafari側で消さないよう変更
2. manifest.webmanifest の start_url を削除
   → iPhoneで「ホーム画面に追加」した時、QRで開いた現在URLを起動元として使えるようにする
3. ホーム画面アプリ起動時にも family_setup を読み込み
   → Supabase URL / anon key / 家族名 / 本人設定をPWA側localStorageへ自動保存
4. 家族フィルター保存キーを calendar_filter に修正
5. manifest.webmanifest をZIPへ復元
6. JavaScript構文チェック済み

重要な入れ直し手順
既にホーム画面へ追加済みの古いアイコンは、古い起動URLを持っています。
そのため一度削除して、v2.9.3公開後にQRから再度追加してください。

手順
1. GitHub Pagesへ index.html / sw.js / manifest.webmanifest を上書き
2. iPhoneの既存「家族カレンダー」ホーム画面アイコンを削除
3. 本人用QRを標準カメラで読み取る
4. Safariで開いたページを閉じたりURLを変更したりせず、
   そのまま共有 → ホーム画面に追加
5. ホーム画面の新しいアイコンから起動
6. Supabase接続設定と本人設定が自動反映されることを確認
