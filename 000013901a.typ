#import "@preview/cetz:0.4.2"
#import "typ/templates/okiken.typ": *
#import "typ/utils/replace.typ": replace
#show: okiken-style.with(title-color-map: color.map.crest.rev(), progress-char: rotate(45deg, emoji.airplane))
#show: replace

#set document(
  title: "２０２５年度 総合職試験（大卒程度試験）\n教養区分以外 基礎能力試験",
  author: "okik-en",
  description: "",
)
#set page(paper: "a4")
#set text(bottom-edge: "bounds")

#let aside(body) = align(end)[#set text(luma(64), size: .8em);#body]
#let url(href) = link(href, raw(href))
#let No(n) = text(
  size: 11pt,
  font: family.serif,
  "【No." + h(1em) + text(font: family.sans, str(n)) + "】",
)
#let Lv(n) = {
  h(1fr)
  box(
    text(
      size: 11pt,
      font: family.serif,
      "Lv. " + str(n) + h(1em) + $suit.club.filled$ * n + $suit.club.stroked$ * (5 - n),
    ),
  )
}
#let answer(ans) = box(
  stroke: 1pt + red,
  inset: (x: 6pt, y: 3pt),
  radius: 2pt,
  baseline: 5pt,
  text(size: 1em, font: family.sans, weight: "bold", "解答 : " + str(ans) + "."),
)

#title()
#aside[問題：#url("https://www.jinji.go.jp/content/000013901.pdf")、GitHub：#url("https://github.com/okik-en/officer")]

= #No(11) #Lv(1)

できれば一瞬で解きたい問題だ。
#quote[トートバッグを使用している人は、スニーカーを履いていない。]のだから、#quote[リュックサックとトートバッグの両方を使用している人は、スニーカーを履いていない。]も当然成り立つ。
すなわち、答えは1.だ。
#answer(1)

別にベン図を用いて愚直に調べる方法を示す。
例えばすべての要素$x$について$x in P ==> x in Q$であるとき、その様子は$Q$が$P$を完全に覆う様子「$P subset Q$」としてかける（@PsubQ）。

#figure(
  caption: $P subset Q$,
  cetz.canvas({
    import cetz.draw: *
    import "typ/utils/cetz.typ": slashed
    circle(
      (.2, 0),
      radius: (.8, .6),
      fill: slashed(),
      name: "P",
    )
    content((name: "P", anchor: 120deg), box(fill: white, inset: 1pt, radius: 100%, $P$))
    circle((0, .1), radius: (1.4, 1), name: "Q")
    content((name: "Q", anchor: 120deg), box(fill: white, inset: 1pt, radius: 100%, $Q$))
  }),
) <PsubQ>

ベン図を用いることで、各要素の特徴を調べたいときに、それらを集合の関係として整理することは視覚的に理解しやすいからだ。
ただし、$4$つ以上の集合に関しては注意して用いよ。

順番に見ていこう。
まず、#quote[スニーカーを履いている人は、リュックサックを使用している。]のであるから、「スニーカーを履いている人」の集合を$S$、「リュックサックを使用している人」の集合を$R$とすれば、$S subset R$であることがわかる。

#let cond1 = {
  import cetz.draw: *
  circle((-.9, .1), radius: (.6, .5), name: "S")
  content((name: "S", anchor: 120deg), box(fill: white, inset: 1pt, radius: 100%, $S$))
  circle((-.8, .1), radius: (1.4, 1), name: "R")
  content((name: "R", anchor: 120deg), box(fill: white, inset: 1pt, radius: 100%, $R$))
}

#figure(
  caption: $S subset R$,
  cetz.canvas(cond1),
) <SsubR>

次に、#quote[電車で通学している人は、リュックサック又はトートバッグを使用している。]のだから、「電車で通学している人」の集合を$T$、「トートバッグを使用している人」の集合を$B$とすれば、$T subset R union B$であることがわかる。

#let cond2 = {
  import cetz.draw: *
  circle((0, 0), radius: (1.4, .4), name: "T")
  content((name: "T", anchor: 45deg), box(fill: white, inset: 1pt, radius: 100%, $T$))
  circle((.8, .1), radius: (1.4, 1), name: "B")
  content((name: "B", anchor: 60deg), box(fill: white, inset: 1pt, radius: 100%, $B$))
}

#figure(
  caption: $T subset R union B$,
  cetz.canvas({
    cond1
    cond2
  }),
) <TsubRuniB>

さらに、#quote[トートバッグを使用している人は、スニーカーを履いていない。]のだから、$B$と$S$の関係について$B subset overline(S)$であることがわかる。
すなわち、$B inter S = emptyset$である。

#let cond3 = {
  import cetz.draw: *
  circle((-1.4, 0), radius: (.4, .4), name: "S")
  content((name: "S", anchor: 120deg), box(fill: white, inset: 1pt, radius: 100%, $S$))
  circle((-.8, .1), radius: (1.4, 1), name: "R")
  content((name: "R", anchor: 120deg), box(fill: white, inset: 1pt, radius: 100%, $R$))
}

#figure(
  caption: $B subset overline(S)$,
  cetz.canvas({
    cond2
    cond3
  }),
) <SsubR>

いま、各々の選択肢について反例を考えると、2.、3.、4.、5.は @counter に示すように反例を持つ。
一方で$R inter B subset overline(S)$が成り立つので、1.は常に成立する。

#let counter = {
  import cetz.draw: *
  line((1, 0), (rel: (-.5, -1.2)), stroke: .4pt)
  content((), box(fill: white, inset: 1pt, radius: 100%, [2.3.]))
  line((-1.6, -.1), (rel: (.5, -1.1)), stroke: .4pt)
  content((), box(fill: white, inset: 1pt, radius: 100%, [4.5.]))
}

#figure(
  caption: [反例の一部],
  cetz.canvas({
    cond2
    cond3
    counter
  }),
) <counter>

あるいは、表を用いて整理するのもよいだろう。
条件を満たさない組み合わせに$crossmark$をつけていき、完成した @tf をもとに選択肢の真偽をたしかめればよい。

#figure(
  caption: [表による整理],
  table(
    stroke: none,
    columns: (3em,) * 5,
    table.vline(x: 1),
    [], $s dot r$, $s dot overline(r)$, $overline(s) dot overline(r)$, $overline(s) dot r$,
    table.hline(),
    $t dot b$, $crossmark^3$, $crossmark^(1, 3)$, $$, $1.$,
    $t dot overline(b)$, $$, $crossmark^(1, 2)$, $crossmark^2$, $$,
    $overline(t) dot overline(b)$, $$, $crossmark^1$, $$, $$,
    $overline(t) dot b$, $crossmark^3$, $crossmark^(1, 3)$, $$, $1.$,
  ),
) <tf>

= #No(12) #Lv(1)

これもベン図で解くのが手っ取り早い。
まず、#quote[広島県に行かなかった人は$80 "人"$だった。]のだから、広島県に行った人は$100 "人" - 80 "人" = 20 "人"$である。
また、#quote[京都府に行った人は$63 "人"$だった。]ことも記載する。

#figure(
  cetz.canvas({
    import cetz.draw: *
    // 円
    circle((90deg, .5), name: "H")
    circle((210deg, .5), name: "K")
    // ラベル
    content((name: "H", anchor: 130deg), box(fill: white, inset: 1pt, text(size: 8pt, "広島県(20)")))
    content((name: "K", anchor: 220deg), box(fill: white, inset: 1pt, text(size: 8pt, "京都府(63)")))
  }),
)

以下同様にベン図を用いて整理する。

#quote[広島県に行き、かつ、京都府に行かなかった人は$7 "人"$で、そのうち$2 "人"$は北海道に行った。]

#figure(
  cetz.canvas({
    import cetz.draw: *
    import "typ/utils/cetz.typ": slashed
    // 円
    circle((90deg, .5), name: "A")
    circle((210deg, .5), name: "B")
    circle((330deg, .5), name: "C")
    // 塗りつぶし
    intersections("A-B", "A", "B")
    merge-path(name: "A&-B", stroke: 1.5pt, fill: slashed(), {
      arc-through(
        "A-B.0",
        (name: "A", anchor: 60deg),
        "A-B.1",
      )
      arc-through(
        "A-B.1",
        (name: "B", anchor: 60deg),
        "A-B.0",
      )
    })
    // ラベル
    content((name: "A", anchor: 130deg), box(fill: white, inset: 1pt, text(size: 8pt, "広島県(20)")))
    content((name: "B", anchor: 210deg), box(fill: white, inset: 1pt, text(size: 8pt, "京都府(63)")))
    content((name: "C", anchor: 330deg), box(fill: white, inset: 1pt, text(size: 8pt, "北海道")))
    // 説明
    line((name: "A", anchor: 20deg), (rel: (1, .3)))
    content((), box(fill: white, inset: 1pt, [7]))
    content((30deg, .8), box(fill: white, inset: 1pt, [2]))
    content((70deg, 1.1), box(fill: white, inset: 1pt, [5]))
  }),
)

#quote[京都府に行き、かつ、北海道にも行った人は$11 "人"$だった。]

#figure(
  cetz.canvas({
    import cetz.draw: *
    import "typ/utils/cetz.typ": slashed
    // 円
    circle((90deg, .5), name: "A")
    circle((210deg, .5), name: "B")
    circle((330deg, .5), name: "C")
    // 塗りつぶし
    intersections("B-C", "B", "C")
    merge-path(name: "B&C", stroke: 1.5pt, fill: slashed(), {
      arc-through(
        "B-C.0",
        (name: "B", anchor: 0deg),
        "B-C.1",
      )
      arc-through(
        "B-C.1",
        (name: "C", anchor: 180deg),
        "B-C.0",
      )
    })
    // ラベル
    content((name: "A", anchor: 130deg), box(fill: white, inset: 1pt, text(size: 8pt, "広島県(20)")))
    content((name: "B", anchor: 210deg), box(fill: white, inset: 1pt, text(size: 8pt, "京都府(63)")))
    content((name: "C", anchor: 330deg), box(fill: white, inset: 1pt, text(size: 8pt, "北海道")))
    // 説明
    content((30deg, .8), box(fill: white, inset: 1pt, [2]))
    content((70deg, 1.1), box(fill: white, inset: 1pt, [5]))
    line((name: "C", anchor: 160deg), (rel: (-1.1, .6)))
    content((), box(fill: white, inset: 1pt, [11]))
  }),
)

#quote[広島県にも京都府にも行かなかった人のうち、北海道に行った人は$12 "人"$だった。]さらに、#quote[広島県にも北海道にも行かなかった人のうち、京都府に行った人は$42 "人"$だった。]

#figure(
  cetz.canvas({
    import cetz.draw: *
    import "typ/utils/cetz.typ": slashed
    // 円
    circle((90deg, .5), name: "A")
    circle((210deg, .5), name: "B")
    circle((330deg, .5), name: "C")
    // 塗りつぶし
    intersections("B-C", "B", "C")
    merge-path(name: "B&C", stroke: 1.5pt, fill: slashed(), {
      arc-through(
        "B-C.0",
        (name: "B", anchor: 0deg),
        "B-C.1",
      )
      arc-through(
        "B-C.1",
        (name: "C", anchor: 180deg),
        "B-C.0",
      )
    })
    // ラベル
    content((name: "A", anchor: 130deg), box(fill: white, inset: 1pt, text(size: 8pt, "広島県(20)")))
    content((name: "B", anchor: 210deg), box(fill: white, inset: 1pt, text(size: 8pt, "京都府(63)")))
    content((name: "C", anchor: 330deg), box(fill: white, inset: 1pt, text(size: 8pt, "北海道(25)")))
    // 説明
    content((30deg, .8), box(fill: white, inset: 1pt, [2]))
    content((70deg, 1.1), box(fill: white, inset: 1pt, [5]))
    line((name: "C", anchor: 160deg), (rel: (-1.1, .6)))
    content((), box(fill: white, inset: 1pt, [11]))
    content((345deg, 1.1), box(fill: white, inset: 1pt, [12]))
    content((195deg, 1.1), box(fill: white, inset: 1pt, [42]))
  }),
)

まず京都府に行った人に着目すると、北海道には行っていないが広島県には行った人の数は、$63 - 42 - 11 = 10 "人"$である。
また広島県に行った人に着目すると、北海道と京都にも行った人の数は、$20 - 10 - 5 - 2 = 3 "人"$である。
これにより、京都府と北海道には行ったが広島県には行かなかった人の数は$11 - 3 = 8 "人"$とわかる。

#figure(
  cetz.canvas({
    import cetz.draw: *
    // 円
    circle((90deg, .5), name: "A")
    circle((210deg, .5), name: "B")
    circle((330deg, .5), name: "C")
    // ラベル
    content((name: "A", anchor: 130deg), box(fill: white, inset: 1pt, text(size: 8pt, "広島県(20)")))
    content((name: "B", anchor: 210deg), box(fill: white, inset: 1pt, text(size: 8pt, "京都府(63)")))
    content((name: "C", anchor: 330deg), box(fill: white, inset: 1pt, text(size: 8pt, "北海道(25)")))
    // 説明
    content((30deg, .8), box(fill: white, inset: 1pt, [2]))
    content((70deg, 1.1), box(fill: white, inset: 1pt, [5]))
    content((345deg, 1.1), box(fill: white, inset: 1pt, [12]))
    content((195deg, 1.1), box(fill: white, inset: 1pt, [42]))
    content((150deg, .8), box(fill: white, inset: 1pt, [10]))
    content((0, 0), box(fill: white, inset: 1pt, [3]))
    content((270deg, .75), box(fill: white, inset: 1pt, [8]))
  }),
)

それぞれの選択肢について、正しい人数部分はそれぞれ、1.は$3 "人"$、2.は$12 + 8 = 20 "人"$、4.は$12 + 2 = 14 "人"$、5.は$12 + 2 + 11 = 25 "人"$であるから、これらはすべて誤りである。
その一方で、選択肢3.の#quote[広島県に行き、かつ、北海道に行かなかった人は$15 "人"$だった。]という記述については、確かに$5 + 10 = 15 "人"$であることから、正しい。
#answer(3)

= #No(13) #Lv(2)

愚直に試していくのが早いだろう。
樹形図を @elephant-tree に示す。
ただし$upright(O)$はON、$upright(X)$はOFFを示し、記号は寄せている。
最終的にONであるボタンの数は$1$個あるいは$3$個であり、答えは1.であることがわかる。
#answer(1)

#figure(
  caption: [樹形図（$*$は変化した部分）],
  cetz.canvas({
    import cetz.draw: *
    import cetz.tree
    set-style(content: (padding: .2))
    tree.tree((
      $upright(X X X X X)$,
      (
        $upright(limits(O)^* X X X X)$,
        (
          $upright(limits(O)^* limits(O)^* O X X)$,
          (
            $upright(limits(O)^* O O limits(X)^* X)$,
            (
              $upright(limits(O)^* O O limits(X)^* X)$,
              $upright(limits(O)^* O O limits(X)^* X)$,
              $upright(O limits(X)^* limits(X)^* X X)$,
            ),
            (
              $upright(O limits(X)^* limits(X)^* X X)$,
              $upright(limits(O)^* limits(X)^* X X X)$,
              $upright(limits(O)^* limits(O)^* O X X)$,
            ),
          ),
          (
            $upright(limits(O)^* limits(O)^* O O O)$,
            ($upright(O O O limits(X)^* limits(X)^*)$, $upright(O limits(X)^* limits(X)^* X X)$),
          ),
        ),
      ),
    ))
  }),
) <elephant-tree>

ここで、選ばれるボタンの組み合わせは$(upright(O), upright(O))$、$(upright(O), upright(X))$、$(upright(X), upright(X))$のいずれかであり、操作BでONになっているボタンの数は$2$個増減するか、あるいは増減しない。
また、$4$回目の操作Bで$upright(O O O O O)$になることはない（@counter-tree）。
よって答えは1.となる。

#figure(
  caption: [背理法],
  cetz.canvas({
    import cetz.draw: *
    import cetz.tree
    set-style(content: (padding: .2))
    tree.tree(
      (
        $upright(limits(O)^* limits(O)^* O O O)$,
        (
          $upright(limits(O)^* limits(O)^* O X X)$,
          (
            $upright(limits(O)^* limits(X)^*_* limits(X)_* X X)$,
            [$upright(O limits(X)^* limits(X)^* X X)$（矛盾）],
            [$upright(limits(O)^* O O limits(X)^*_* limits(X)_*)$（矛盾）],
          ),
        ),
      ),
      direction: "up",
    )
  }),
) <counter-tree>

= #No(14) #Lv(3)

闇雲に条件を整理していったところで、「真向かい」「隣」などの言葉は思ったより曖昧であることがわかるだろう。
「曖昧でないものから」順に整理していくという発想が重要だ。

- #quote[Aの店の真向かいの建物の西隣に文具店がある。
  ] $==>$ 文具店は3、5、8、10のいずれか。
- #quote[Bの店は、Aの店の隣で、東側のみ道路に面しており、Bの店の真向かいの建物の南隣に寿司店がある。
  ] $==>$ *Aの店は2*、*文具店は5*、*Bの店は1*、*寿司店は8*。

#figure(
  cetz.canvas({
    import cetz.draw: *
    import cetz.tree
    set-style(content: (padding: .2))
    tree.tree(
      (
        [候補],
        ([3 = 文具店], ([4 = A], ([6 = B], $crossmark$)), ([8 = A], $crossmark$)),
        ([*5 = 文具店*], ([*2 = A*], ([*1 = B*], [*8 = 寿司店*])), ([10 = A], $crossmark$)),
        ([8 = 文具店], ([11 = A], $crossmark$)),
        ([10 = 文具店], ([9 = A], $crossmark$)),
      ),
    )
  }),
)

- #quote[書店と文具店は隣どうしであり、書店の真向かいにDの店がある。
  ] $==>$ *書店は4*、Dの店は2か10。
  しかし2はAの店であるから、*Dの店は10*。

この時点で6人の店は1、2、4、5、8、10であることがわかった。

- #quote[Cの店は、喫茶店の南隣の建物の真向かいで、東側は道路に面している。
  ] $==>$ 喫茶店は1、4、10のいずれで、条件を満たすのは1のみ。
  よって、*喫茶店は1*、*Cの店は4*。
- #quote[和菓子店は、Eの店の真向かいで、東側は道路に面している。
  ] $==>$ 和菓子店は1、2、4のいずれかで、条件を満たすのは2のみ。
  よって、*和菓子店は2*、*Eの店は8*。
残った5はFの店で、10は生花店とわかる。
これより答えは4.となる。
#answer(4)

#figure(
  caption: [正しい対応の表],
  table(
    stroke: none,
    columns: (4em,) + (5em,) * 6,
    table.vline(x: 1),
    table.hline(),
    [立地], [1], [2], [4], [5], [8], [10],
    table.hline(),
    [店], [喫茶店], [和菓子店], [書店], [文具店], [寿司店], [生花店],
    table.hline(),
    [経営者], [B], [A], [C], [F], [E], [D],
    table.hline(),
  ),
)

#pagebreak()

= #No(15) #Lv(3)

与えられた条件を一つずつ整理していく。

#figure(
  table(
    stroke: none,
    columns: (5em,) * 7,
    table.vline(x: 1),
    table.hline(),
    [人], [A], [B], [C], [D], [E], [F],
    table.hline(),
    [住所], [], [Z市], [], [X市], [], [X市],
    table.hline(),
    [在籍期間], [2年], [], [], [2年], [2年], [3年],
    table.hline(stroke: (dash: "dotted")),
    [在籍年度], [21,22], [22,], [], [], [], [],
    table.hline(),
  ),
)

まず、#quote[Cが他の部署に異動した年度にDが総務課に異動してきた]ことから、二人はともに2年間在籍し、Cは2020、2021年度に、Dは2022、2023年度に在籍していたとわかる。
次に、#quote[A～Fについて、2年間だけ在籍していた者は4人、3年間だけ在籍していた者は2人おり]とあるので、残ったBは3年間在籍していたとわかる。
これは#quote[3年間だけ在籍していた者はZ市に住んでいる者とFだった]ことにも矛盾しない。

#figure(
  table(
    stroke: none,
    columns: (5em,) * 7,
    table.vline(x: 1),
    table.hline(),
    [人], [A], [B], [C], [D], [E], [F],
    table.hline(),
    [住所], [], [Z市], [], [X市], [], [X市],
    table.hline(),
    [在籍期間], [2年], [*3年*], [*2年*], [2年], [2年], [3年],
    table.hline(stroke: (dash: "dotted")),
    [在籍年度], [21,22], [22,], [*20,21*], [*22,23*], [], [],
    table.hline(),
  ),
)

さらに、#quote[2020年度に在籍していた者は2人おり、X市に住んでいる者とZ市に住んでいる者だった]ことから、CはZ市に住んでおり、Fは2020年度から3年間在籍していたとわかる。
残ったAとEはY市に住んでいる。
Bは2020年度には在籍していないため、2021年度から3年間在籍していたとわかる。

#figure(
  table(
    stroke: none,
    columns: (5em,) * 7,
    table.vline(x: 1),
    table.hline(),
    [人], [A], [B], [C], [D], [E], [F],
    table.hline(),
    [住所], [*Y市*], [Z市], [*Z市*], [X市], [*Y市*], [X市],
    table.hline(),
    [在籍期間], [2年], [3年], [2年], [2年], [2年], [3年],
    table.hline(stroke: (dash: "dotted")),
    [在籍年度],
    [21,22],
    [*21,22,23*],
    [20,21],
    [22,23],
    [],
    [*20,21,22*],
    table.hline(),
  ),
)

これらの条件に沿うのは、4.の#quote[2022年度に在籍していたのは5人だった。]である。
まず、A、B、D、Fが2022年度に在籍していたことは上述の通りである。
また、Eについては2年在籍しており、かつ2020年度には在籍していないことから、2021年度と2022年度、あるいは2022年度と2023年度に在籍しており、いずれにせよ2022年度には在籍していることが明らかだ。
ゆえに2022年度に在籍していたのは、Cを除く$5$人とわかる。
#answer(4)

= #No(16) #Lv(4)

与えられた情報を表で整理していく。

#figure(
  table(
    columns: (8em,) + (4em,) * 6,
    [菓子], [ウ], [カ], [ア], [エ], [イ], [オ],
    [Eが付けた得点], [$6$点], [$4$点], [$5$点], [$3$点], [$2$点], [$1$点],
    table.cell(colspan: 7, inset: 1pt, []),
    [合計得点], [$28$点], [$26$点], [$19$点], [$17$点], [$9$点], [$6$点],
  ),
)

説明を注意深く読むと、#quote[Aと同じ得点を付けた菓子があった審査員は、修正前の集計では#underline[Bだけ]で、修正後の集計では#underline[Cだけ]であった。]とあり、かつ#quote[得点を逆に付けていた審査員は$2$人で、そのうちの$1$人はCであった。]とあることから、得点を逆に付けていた審査員はBとCであることがわかる。

まず菓子オに着目する。合計得点から、菓子オに$1$点を付けた審査員は$4$人、$2$点を付けた審査員は$1$人であることがわかり、前述の条件より後者はAであることがわかる。
菓子イに$2$点を付けたのは$4$人、$1$点を付けたのは$1$人であることから、後者はAである。

#figure(
  table(
    columns: (8em,) + (4em,) * 6,
    [菓子], [ウ], [カ], [ア], [エ], [イ], [オ],
    [Aが付けた得点], [], [], [], [], [$1$点], [$2$点],
    [Bが付けた得点], [], [], [], [], [$2$点], [$1$点],
    [Cが付けた得点], [], [], [], [], [$2$点], [$1$点],
    [Dが付けた得点], [], [], [], [], [$2$点], [$1$点],
    [Eが付けた得点], [$6$点], [$4$点], [$5$点], [$3$点], [$2$点], [$1$点],
    table.cell(colspan: 7, inset: 1pt, []),
    [合計得点], [$28$点], [$26$点], [$19$点], [$17$点], [$9$点], [$6$点],
  ),
)

ここでAが菓子エに付けた点数としてありうるのは、$4$点あるいは$5$点である。
Aが菓子エに$5$点を付けたと仮定すると、B～Dは$3$点を付けたこととなる。このとき菓子アに付けられ得る得点は少なくとも$20$点であり、合計得点が$19$点であることに矛盾する。

#figure(
  table(
    columns: (8em,) + (4em,) * 6,
    [菓子], [ウ], [カ], [ア], [エ], [イ], [オ],
    [Aが付けた得点], [], [], [$>=3$点], [$5$点], [$1$点], [$2$点],
    [Bが付けた得点], [], [], [$>=4$点], [$3$点], [$2$点], [$1$点],
    [Cが付けた得点], [], [], [$>=4$点], [$3$点], [$2$点], [$1$点],
    [Dが付けた得点], [], [], [$>=4$点], [$3$点], [$2$点], [$1$点],
    [Eが付けた得点], [$6$点], [$4$点], [$5$点], [$3$点], [$2$点], [$1$点],
    table.cell(colspan: 7, inset: 1pt, []),
    [合計得点], [$28$点], [$26$点], [$19$点], [$17$点], [$9$点], [$6$点],
  ),
)

よって菓子エに$4$点を付けた審査員はAとCであり、他$3$人は$3$点をつけたことがわかる。
また、各審査員が菓子アに付けた点数は、AとCが$3$点、BとDが$4$点であることがわかる。

#figure(
  table(
    columns: (8em,) + (4em,) * 6,
    [菓子], [ウ], [カ], [ア], [エ], [イ], [オ],
    [Aが付けた得点], [], [], [$3$点], [$4$点], [$1$点], [$2$点],
    [Bが付けた得点], [], [], [$4$点], [$3$点], [$2$点], [$1$点],
    [Cが付けた得点], [], [], [$3$点], [$4$点], [$2$点], [$1$点],
    [Dが付けた得点], [], [], [$4$点], [$3$点], [$2$点], [$1$点],
    [Eが付けた得点], [$6$点], [$4$点], [$5$点], [$3$点], [$2$点], [$1$点],
    table.cell(colspan: 7, inset: 1pt, []),
    [合計得点], [$28$点], [$26$点], [$19$点], [$17$点], [$9$点], [$6$点],
  ),
)

菓子カに着目すると、AとCは菓子カに$3$点を付け、BとDは$4$点を付けたことがわかる。ゆえにそれぞれが菓子ウに付けた点数は、AとCが$5$点、他$3$人が$6$点である。

#figure(
  caption: [修正後の集計],
  table(
    columns: (8em,) + (4em,) * 6,
    [菓子], [ウ], [カ], [ア], [エ], [イ], [オ],
    [Aが付けた得点], [$5$点], [$6$点], [$3$点], [$4$点], [$1$点], [$2$点],
    [Bが付けた得点], [$6$点], [$5$点], [$4$点], [$3$点], [$2$点], [$1$点],
    [Cが付けた得点], [$5$点], [$6$点], [$3$点], [$4$点], [$2$点], [$1$点],
    [Dが付けた得点], [$6$点], [$5$点], [$4$点], [$3$点], [$2$点], [$1$点],
    [Eが付けた得点], [$6$点], [$4$点], [$5$点], [$3$点], [$2$点], [$1$点],
    table.cell(colspan: 7, inset: 1pt, []),
    [合計得点], [$28$点], [$26$点], [$19$点], [$17$点], [$9$点], [$6$点],
  ),
)

#figure(
  caption: [修正前の集計],
  table(
    columns: (8em,) + (4em,) * 6,
    [菓子], [ウ], [カ], [ア], [エ], [イ], [オ],
    [Aが付けた得点], [$5$点], [$6$点], [$3$点], [$4$点], [$1$点], [$2$点],
    [Bが付けた得点], [$1$点], [$2$点], [$3$点], [$4$点], [$5$点], [$6$点],
    [Cが付けた得点], [$2$点], [$1$点], [$4$点], [$3$点], [$5$点], [$6$点],
    [Dが付けた得点], [$6$点], [$5$点], [$4$点], [$3$点], [$2$点], [$1$点],
    [Eが付けた得点], [$6$点], [$4$点], [$5$点], [$3$点], [$2$点], [$1$点],
    table.cell(colspan: 7, inset: 1pt, []),
    [合計得点], [$28$点], [$26$点], [$19$点], [$17$点], [$9$点], [$6$点],
  ),
)

よってCとEは、修正前では菓子エに、修正後では菓子イとオに同じ点数を付けたことが分かるため、答えは5.とわかる。
#answer(5)

= #No(17) #Lv(1)

#let to3(n) = (calc.quo(n, 9), calc.quo(calc.rem(n, 9), 3), calc.rem(n, 3)).rev()
#let face(pos, func) = (0, 1, 3, 2, 0).map(n => cetz.vector.add(pos, func(..(1, 2).map(m => n.bit-and(m).signum()))))

#let ang = (x: 20deg, y: 20deg, z: 0deg)
#let blk-A = (13, 21, 22, 25, 26)
#let blk-D = (14, 15, 16, 17, 24)
#let blk-AD = blk-A + blk-D
#let plc = range(27).filter(n => not blk-AD.contains(n))

#figure(
  caption: [与えられた図形],
  cetz.canvas({
    import cetz.draw: *
    set-style(line: (stroke: .4pt))
    ortho(..ang, {
      for p in plc.map(to3) {
        line(..face(p, (i, j) => (1, i, j)), fill: luma(208))
        line(..face(p, (i, j) => (j, 1, i)), fill: luma(240))
        line(..face(p, (i, j) => (i, j, 1)), fill: luma(248))
      }
    })
  }),
) <given>

三次元の立体図形を整理するために我々が用いてきた手法は、二次元に落として考えるというものだ。
ここでは @given
を次のようにわけて考えよう。

#figure(
  cetz.canvas({
    import cetz.draw: *
    set-style(line: (stroke: .4pt))
    ortho(..ang, {
      for (x, y, z) in plc.map(to3) {
        let p = (x - z, y, 2 * z)
        line(..face(p, (i, j) => (1, i, j)), fill: luma(208))
        line(..face(p, (i, j) => (j, 1, i)), fill: luma(240))
        line(..face(p, (i, j) => (i, j, 1)), fill: luma(248))
      }
    })
  }),
)

いま不足している部分を考える。

#figure(
  cetz.canvas({
    import cetz.draw: *
    set-style(line: (fill: white, stroke: (thickness: .2pt, dash: "dashed")))
    ortho(..ang, {
      for (x, y, z) in blk-AD.map(to3) {
        let p = (x - z, y, 2 * z)
        line(..face(p, (i, j) => (1, i, j)), fill: luma(208))
        line(..face(p, (i, j) => (j, 1, i)), fill: luma(240))
        line(..face(p, (i, j) => (i, j, 1)), fill: luma(248))
      }
    })
  }),
)

BとCの形はどう頑張っても当てはまらないだろう。
逆に、AとDは @combined のように組み合わせることであてはめられる。
よってAとDの組を選ぶのが正しい。
#answer(2)

#figure(
  caption: [A（赤）とD（青）の組み合わせ],
  cetz.canvas({
    import cetz.draw: *
    ortho(..ang, {
      for p in blk-D.map(to3) {
        set-style(line: (stroke: blue + 1pt))
        line(..face(p, (i, j) => (1, i, j)), fill: luma(208))
        line(..face(p, (i, j) => (j, 1, i)), fill: luma(240))
        line(..face(p, (i, j) => (i, j, 1)), fill: luma(248))
      }
      set-style(line: (stroke: red + 1pt))
      for (x, y, z) in blk-A.map(to3) {
        let p = (x, y - .5, z + 2)
        line(..face(p, (i, j) => (1, i, j)), fill: luma(208))
        line(..face(p, (i, j) => (j, 1, i)), fill: luma(240))
        line(..face(p, (i, j) => (i, j, 1)), fill: luma(248))
      }
    })
  }),
) <combined>

= #No(18) #Lv(3)

#quote[A、B、Cの$3$人は、第$1$部又は第$3$部のいずれかの部でまとめて行う]ことと#quote[AとDはいずれかの部の最初に行い、かつ、Fはいずれかの部の最後に行う]こと、また#quote[EはDより先に行い、かつ、EとDとの間には休憩と$2$人の面談が入る]ことより、あり得る組み合わせは次の通りである。

#figure(
  caption: [可能な組み合わせ],
  table(
    columns: (4em,) + (.2em,) + (2em,) * 3 + (1.5em,) + (2em,) * 4 + (1.5em,) + (2em,) * 3,
    align: center + horizon,
    [形式1],
    table.cell(rowspan: 4)[],
    table.cell(rowspan: 2)[A],
    table.cell(colspan: 2, rowspan: 2)[B / C],
    table.cell(rowspan: 4)[休憩],
    [],
    table.cell(rowspan: 2)[E],
    [],
    [F],
    table.cell(rowspan: 4)[休憩],
    table.cell(rowspan: 2)[D],
    table.cell(fill: aqua)[],
    table.cell(fill: aqua)[],
    [形式2],
    [], table.cell(fill: aqua)[], table.cell(fill: aqua)[], [], [F], [形式3],
    table.cell(rowspan: 2)[E],
    [],
    [F],
    table.cell(rowspan: 2)[D],
    table.cell(fill: yellow)[],
    table.cell(fill: yellow)[],
    table.cell(fill: yellow)[],
    table.cell(rowspan: 2)[A],
    table.cell(colspan: 2, rowspan: 2)[B / C],
    [形式4],
    table.cell(fill: aqua)[],
    table.cell(fill: aqua)[],
    table.cell(fill: aqua)[],
    table.cell(fill: aqua)[],
    [F],
  ),
) <possible>

#let sample(color) = {
  h(.25em)
  box(fill: color, height: 1em, width: 1em, stroke: .4pt, baseline: 1pt)
  h(.25em)
}

また、#quote[GとHとの間には$1$人以上の面談が入る]ことより、 @possible 中 #sample(aqua) 部分にはGとHの両方が入ることはなく、また #sample(yellow) 部分にはGとHが連続して入ることはない。よって
$
  underbracket(2!, "B/C") times {underbracket((4! - 2!), "形式1") + underbracket((4! - 2!), "形式2") + underbracket((4! - 2! - 2!), "形式3") + underbracket((4! - 2! - 2!), "形式4")} = 144
$
通りが求める値であり、ゆえに正しい選択肢は1.である。
#answer(1)

= #No(19) #Lv(1)

#figure(
  table(
    stroke: none,
    columns: (1fr,) * 2,
    [#set box(inset: 3pt)
      #cetz.canvas({
        import cetz.draw: *
        line((0, .5), (rel: (.6, 0)), (rel: (.2, .4)), (rel: (-1, 0)), (rel: (.2, -.4)), close: true)
        line((rel: (.2, .4)), (rel: (0, .5)), (rel: (.4, -.1)), (rel: (-.4, -.2)))
        content((rel: (.1, -.4)), [A])
        line((rel: (-.4, 0)), (rel: (-4, 0)), mark: (end: ">", fill: black))
        content((), anchor: "east", box($4V$))
        line((-2, -.5), (rel: (.6, 0)), (rel: (.2, .4)), (rel: (-1, 0)), (rel: (.2, -.4)), close: true)
        line((rel: (.2, .4)), (rel: (0, .5)), (rel: (.4, -.1)), (rel: (-.4, -.2)))
        content((rel: (.1, -.4)), [B])
        line((rel: (-.4, 0)), (rel: (-3, 0)), mark: (end: ">", fill: black))
        content((), anchor: "east", box($2V + V$))
      })],
    [#set box(inset: 3pt)
      #cetz.canvas({
        import cetz.draw: *
        line((0, .5), (rel: (.6, 0)), (rel: (.2, .4)), (rel: (-1, 0)), (rel: (.2, -.4)), close: true)
        line((rel: (.2, .4)), (rel: (0, .5)), (rel: (.4, -.1)), (rel: (-.4, -.2)))
        content((rel: (.1, -.4)), [A])
        line((rel: (-.4, 0)), (rel: (-3, 0)), mark: (end: ">", fill: black))
        content((), anchor: "east", box($4V - V$))
        line((-2, -.5), (rel: (.6, 0)), (rel: (.2, .4)), (rel: (-1, 0)), (rel: (.2, -.4)), close: true)
        line((rel: (.2, .4)), (rel: (0, .5)), (rel: (.4, -.1)), (rel: (-.4, -.2)))
        content((rel: (.1, -.4)), [B])
        line((rel: (-.4, 0)), (rel: (-2, 0)), mark: (end: ">", fill: black))
        content((), anchor: "east", box($2V$))
        line((1, 0), (rel: (1, 0)), mark: (end: ">", fill: black))
        content((), anchor: "west", box($V$))
      })],

    [静水時], [遡行時],
  ),
)

川の流れの速さを$V ["m/分"]$とする。
#quote[船Aの静水時の速さは川の流れの速さの$4$倍である]ことから、船Aの航行中の速さは$4V - V = 3V ["m/分"]$である。
また航行中の#quote[船Aの速さは船Bの速さの$display(3/2)$倍であるように見えた]ことから、船Bの航行中の速さは$3V div display(3/2) = 2V ["m/分"]$である。よって船Aおよび船BがY地点からX地点までの航行にかかる時間はそれぞれ$7200 div (3V) = display(2400/V) ["分"]$、$7200 div (2V) = display(3600/V) ["分"]$であり、その差は$10$分である。よって
$
  (display(3600/V) - display(2400/V)) ["分"] = 10 "分" #h(1em) <==> #h(1em) V ["m/分"] = (3600 - 2400)/10 "m/分" = 120 "m/分"
$
であり、2.が答えであると結論付けられる。
#answer(2)

= #No(20) #Lv(1)

ごく基本的な不定方程式の問題だ。
定石としてまずは因数分解を試みる。

#eqref(<xy>)[
  $ x y - 6 x + 4 y = 129 $
]

左辺を因数分解して$(x + 4)(y - 6) = x y - 6x + 4y - 24$としたいので、@xy の両辺から$24$を減じて$(x + 4)(y - 6) = 129 - 24 = 105 = 3 times 5 times 7$とする。
いま、$(X, Y) = (x + 4, y - 6)$とおけば、$X Y = 105$である。
$X$は$4$より大きい整数、$Y$は$-6$より大きい整数であることに注意して、$(X, Y) = (5, 21), (7, 15), (15, 7), (21, 5), (35, 3), (105, 1)$の$6$通りが考えられる。
各組$(X, Y)$は組$(x, y) = (X - 4, Y + 6)$と一対一に対応するため、2.の$6$通りが答えである。
より詳しくは、$(x, y) = (1, 27), (3, 21), (11, 13), (17, 11), (31, 9), (101, 7)$の$6$通りである。
#answer(2)


= #No(21) #Lv(1)

#figure(
  [#set box(inset: 4pt)
    #cetz.canvas({
      import cetz.draw: *
      import "typ/utils/cetz.typ": angle, brace, slashed
      let (A, B, C, D, E) = range(90, 450, step: 72).map(d => (1.5 * calc.cos(d * 1deg), 1.5 * calc.sin(d * 1deg)))
      let (F, G, H, I) = ((A, E, B, C), (A, B, C, D), (C, D, A, E), (A, B, D, E)).map(
        pts => cetz.intersection.line-line(..pts, ray: true),
      )
      // 線分
      line(F, G, H, I, close: true)
      line(C, F)
      line(D, I)
      line(F, H)
      line(G, I)
      // 三角形
      line(A, B, F, close: true, fill: slashed(), stroke: none)
      line(D, E, H, close: true, fill: slashed(), stroke: none)
      // 角度
      angle(F, B, A, $36degree$, radius: .5)
      angle(A, F, B, $72degree$)
      angle(B, A, F, $72degree$)
      angle(H, E, D, $36degree$, radius: .5)
      angle(D, H, E, $72degree$)
      angle(E, D, H, $72degree$)
      // 辺長
      brace(A, B, $1$)
      brace(F, A, $phi$)
      brace(B, F, $phi$)
      brace(A, E, $1$)
      brace(D, E, $1$)
      brace(E, H, $phi$)
      brace(H, D, $phi$)
      // 点のラベル
      content(A, anchor: "south", box([A]))
      content(B, anchor: "east", box([B]))
      content(C, anchor: "north", box([C]))
      content(D, anchor: "north", box([D]))
      content(E, anchor: "east", box([E]))
      content(F, anchor: "south", box([F]))
      content(G, anchor: "east", box([G]))
      content(H, anchor: "west", box([H]))
      content(I, anchor: "south", box([I]))
    })],
)

$triangle upright(A B F)$と$triangle upright(D E H)$はともに頂角$36degree$の二等辺三角形であり、その底辺が$1$であれば他辺は黄金比$phi = display(frac(1 + sqrt(5), 2))$とわかる。
ゆえに、$|upright(F H)| = |upright(F A)| + |upright(A E)| + |upright(E H)| = 1 + 2 phi = 2 + sqrt(5)$であり、答えは5.とわかる。
頂角$36degree$の二等辺三角形の辺比を用いた問題だ。
#answer(5)

下に相似を利用した略証を示す。すなわち、$x = 1 + frac(1, x, style: "skewed")$を解いて$x = phi$と求まる。

#figure(
  table(
    stroke: none,
    columns: 2,
    [#cetz.canvas({
      import cetz.draw: *
      import "typ/utils/cetz.typ": angle, brace, slashed
      let (A, B, C) = ((0, 0), (252deg, 4), (288deg, 4))
      line(A, B, C, close: true, fill: slashed())
      brace(C, B, $1$)
      brace(B, A, $x$)
      brace(A, C, $x$)
      angle(A, B, C, $36degree$, radius: .5)
      angle(B, C, A, $72degree$)
      angle(C, A, B, $72degree$)
    })],
    [#cetz.canvas({
      import cetz.draw: *
      import "typ/utils/cetz.typ": angle, brace, slashed
      let (A, B, C) = ((0, 0), (252deg, 4), (288deg, 4))
      hide(line((4, 0), B, name: "SB"))
      hide(line(A, C, name: "AC"))
      intersections("D", "SB", "AC")
      line(A, B, C, close: true)
      line("D.0", B, C, close: true, fill: slashed(), stroke: none)
      line("D.0", B)
      brace(C, B, $1$)
      brace(B, "D.0", $1$)
      brace(A, "D.0", $1$)
      brace("D.0", C, $frac(1, x, style: "skewed")$)
      angle(A, B, C, $36degree$, radius: .5)
      angle(B, "D.0", A, $36degree$, radius: .5)
      angle(B, C, "D.0", $36degree$, radius: .5)
      angle(C, A, B, $72degree$)
      angle("D.0", B, C, $72degree$)
    })],
  ),
)
