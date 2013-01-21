tan6 Spider

概要

  ・WinXPスパイダソリティアのクローンゲーム。

WinXPスパイダソリティアとの違い

  ・HSP3Dish http://hsp.tv による実装。
  ・画面がiPhoneサイズ(320x480)。
  ・色が４色。
  ・見た目が手抜き。
  ・元に戻すのバッファが1024回分まで(多分足りる)。
  ・ハイスコアと連勝連敗を記録せず。
  ・利便性はそんなに重視せず。
  ・設計がスパゲッティ。
  ・コードがスパゲッティ。

WinXPスパイダソリティアとの違い

  ・一度開いたカードは視認できる。
  ・再挑戦時の初期スコアは落ちる(500→250→125→…)。
  ・再挑戦時、次に配られるカードがプレビューされる。

WinVista以降スパイダソリティアとの違い

  ・完成したスートを戻せない。
  ・配られたカードを戻せない。

利用規約

  ・修正BSDライセンス http://www.freebsd.org/ja/copyright/freebsd-license.html に従います。
  ・著作権は m-ushi に帰属します。
  ・修正BSDライセンスはこのテキストの末尾に添付しています。

必要環境

  ・Windows 32bit版 と思われます。
  ・ご自身でビルドなされるならiOS、Androidでもいけるらしい。

開発環境

  ・HSP3Dish http://hsp.tv/ v3.32b2
  ・WinXP SP3

履歴
  ・v1.3
    tan6ブランドとして設定。
    UI少し変更。
  ・v1.2
    Retry・スリーデックスの実装。
    Win32向けのショートカットキー実装。
    その他微～中修正。
  ・v1.1
    クリア・ギブアップ時にスコアが出ないのを修正。
    ライセンス設定。
    その他微修正。
  ・v1.0
    初版。

操作方法（共通）

  ・Escキー（Win32のみ）
      ゲームを終了

操作方法（メニュー時）

  ・「Lv1」
      スペードだけのゲーム（初級）
  ・「Lv2」
      スペードとハートのゲーム（中級）
  ・「Lv3」
      ダイヤも使用（オリジナル）
  ・「Lv4」
      全スートを使用（上級）
  ・「Exit」
      終了

操作方法（ゲーム時）

  ・クリック
      カードを掴む、置く
  ・ドラッグ
      移動
  ・「-」
      縮小
  ・「0」
      拡縮率を戻す
  ・「+」
      拡大
  ・「←↓↑→」（カードを掴んでいる時）
      移動
  ・「Menu」
      ゲーム中メニューに遷移します。
  ・「Reset」（カードを一度も移動させてない時）
      カード全部配りなおす
  ・「Undo」（カード配布直後、スート完成直後を除く）
      元に戻す
  ・「Hint」（ヒントを出せる時）
      ヒント表示

  ・Zキー（Win32のみ）
      「Reset」「Undo」に同じ
  ・Mキー（Win32のみ）
      「Hint」に同じ
  ・Dキー（Win32のみ）
      「Menu」に同じ

操作方法（ゲーム中メニュー）

  ・「Deal」（フリーセルが存在しない時）
      カードを配る
  ・「Retry」（配るカードがない時）
      同じゲームをやり直す
  ・「Give Up」
      メニュー画面に戻る
  ・「Exit App」（iOS以外）
      ゲームを終了

遊び方

  ・カードを移動して並べ替えます。
  ・カードは一つ数字が大きいカードの下に置けます。
  ・何もない列（フリーセル）ならどんなカードも置けます。
  ・同じスートで連番なら一気に移動できます。
  ・同じスートで13枚連番で揃えると、完成と見做され、その13枚は消えます。
  ・最終的にカードを全部消すことが目的です。

  ・５回カードを配ることができます。
  ・カードは各列の最後尾に１枚ずつ置かれます。

  ・移動する・元に戻すごとにスコアが１点減点されます。
  ・同じスートで13枚連番で揃えて完成すると100点追加されます。

利用フォント

  ・VLゴシックフォントファミリ http://vlgothic.dicey.org/
  ・Symbol http://www.adobe.com/
  ・Webdings Wingdings http://www.microsoft.com/

隠すほどのない隠し要素

  ・メニュー画面で「コピーライト領域」をタップ
      背景が青くなり、３組のトランプで遊べます。
      AisleRiotのスパイダ・スリーデックスのような12列の親切設計ではなく
      10列のままの心折設計となっており、難易度というより詰みゲー度が激増しています。
      作者もLv3までしかクリアできません。それも、極めて稀に。

修正BSDライセンス（英文）

    2012-2013 (C) Masayuki Ushijima.

      Redistribution and use in source and binary forms, with or without modification, 
    are permitted provided that the following conditions are met:

        1.  Redistributions of source code must retain the above copyright notice,
          this list of conditions and the following disclaimer.
        2.  Redistributions in binary form must reproduce the above copyright notice,
          this list of conditions and the following disclaimer in the documentation
          and/or other materials provided with the distribution.

      THIS SOFTWARE IS PROVIDED BY THE FREEBSD PROJECT ``AS IS'' AND ANY EXPRESS OR
    IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
    MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
    SHALL THE FREEBSD PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
    WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
    ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.

      The views and conclusions contained in the software and documentation are those
    of the authors and should not be interpreted as representing official policies,
    either expressed or implied, of the FreeBSD Project.
