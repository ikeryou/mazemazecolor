MazeMazeColor
========

#### Safari(iOS8~)のバウンススクロールを利用したコンテンツ ####

下の図のバウンススクロールして空いた隙間の部分
<img src="http://ikeryou.jp/works/mazemaze/sample.png">

こちら通常であれば
```css
body {
  background-color:#FF0000;
}
```
で好きな色を設定できます。
(画像やグラデーションは不可)

さらになんと、iOS8~の場合この部分を動的に変えてもちゃんと反映されるのをたまたま発見しまして、
一見あまりにも細かすぎる部分なのですが、何か粋な演出のひとつとして使えないかと思いまして、
こんなコンテンツをつくってみました。


※iPhone(iOS8~)<br>
http://ikeryou.jp/works/mazemaze/<br>
・タップでランダムに色変更<br>
・ディーププレスで彩度を変更


### 使い方 ###
<img src="http://ikeryou.jp/works/mazemaze/sample.gif" width="200" height="249">


画面上下の色の合計した色を、バウンススクロールで生じた隙間に反映させてます。
そして、さらにスクロールを続けていくと、例えば下にスクロールし続けていき、
画面下の色が追い出されるにつれて、隙間に反映させていた色から画面下の色を引くことで、
2色の合計値の割合をバウンススクロールでコントロールできるコンテンツです。

非常にマニアックで気付きにくい部分ですが、
うまく演出に落とし込めれば、
意識の高いwebコンテンツになる事間違いなしです
sarafi(iOS8~)限定なので敷居は高いですが、、、


### 対応端末 ###
* safari(iOS8~)
