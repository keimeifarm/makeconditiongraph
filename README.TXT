makeHorseGraph


## 更新履歴
2022/10/30 Ver1.00 新規作成
2023/02/12 Ver1.01 トントントントロ・グラマー追加
2024/04/21 Ver1.02 エバービクトリアス追加。


## 概要
牧場ホームページへ馬の体重・体温を反映させる


## つかいかた
1. 馬情報ファイルをテキストエディタで編集
日付, 体重, 体温 を半角スペース区切りで入力する
* ファイル
  * ./bin/horse_0001_sample.dat
  * ./bin/horse_0002_sample.dat
例
```
2022/11/01 450 36.5
2022/11/02 451 36.3
2022/11/03 459 36.0
```
2. 「makeConditionGraph.sh」を実行
3. おわり


## 馬が増えたときにすること
* homepage/img/horse_xxxx_sample.jpg | 馬画像を追加
* homepage/index.html                | Chart.js記述部分に新しい馬IDを追加
* tool/bin/horse_xxxx_xxx.dat        | 馬用datファイルを用意
* tool/bin/setting.conf              | 馬設定へ馬IDを追加
* tool/makeConditionGraph.sh         | makeHorseJS関数へ新しい馬IDを追加


## よくある質問
（まだない）

