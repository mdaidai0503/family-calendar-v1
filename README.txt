家族カレンダー v2.9.1 フリーズ修正版

原因:
v2.9ではJavaScriptに「familyShareBtn」の処理を追加していましたが、
設定画面HTMLへの「家族共有QR」ボタン追加が反映されていませんでした。
起動時に存在しないボタンへ onclick を設定しようとしてJavaScriptが停止し、
iPhoneではフリーズしたように見える状態になっていました。

修正:
・設定画面に「📱 家族共有QR」ボタンを正しく追加
・QR関連ボタンが万一存在しなくてもカレンダー本体を停止させない防御処理を追加
・Service Workerキャッシュをv2.9.1へ更新
・JavaScript構文チェック済み

上書き:
index.html
sw.js
manifest.webmanifest
