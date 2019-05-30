#!/bin/bash

function update {
  local PAGE_PATH=$1
  [[ out/$PAGE_PATH -nt $PAGE_PATH ]] && return

  local dir=out
  [[ $PAGE_PATH == */* ]] && dir=$dir/${PAGE_PATH%/*}
  [[ -d $dir ]] || mkdir -p "$dir"

  cp "$PAGE_PATH" "out/$PAGE_PATH"
}

function generate {
  local PAGE_PATH=$1
  local TITLE=$2

  [[ out/$PAGE_PATH -nt $PAGE_PATH ]] && return
  # && [[ out/$PAGE_PATH -nt make.sh ]] && return
  local CONTENT=$(< "$PAGE_PATH")

  local CATEGORY=
  if [[ $PAGE_PATH == */* ]]; then
    case ${PAGE_PATH%/*} in
    (math) CATEGORY='数学 - ' ;;
    (phys) CATEGORY='物理 - ' ;;
    (*)    CATEGORY="${PAGE_PATH%/*} -" ;;
    esac
  fi

  local dir=out
  [[ $PAGE_PATH == */* ]] && dir=$dir/${PAGE_PATH%/*}
  [[ -d $dir ]] || mkdir -p "$dir"

  cat <<EOF > "out/$PAGE_PATH"
<!DOCTYPE html>
<html>
<head>
  <title>$TITLE</title>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <link rel="stylesheet" type="text/css" charset="utf-8" href="../memo.css" />

  <meta property="og:type" content="article" />
  <meta property="og:title" content="$TITLE" />
  <meta property="og:image" content="https://akinomyoga.github.io/agh/res/agh.icon.mwg_128x128.png" />
  <meta property="og:url" content="https://akinomyoga.github.io/memo/$PAGE_PATH" />
  <meta property="og:site_name" content="github.akinomyoga.io" />

  <meta name="agh-fly-type" content="tex" />
  <script src="https://akinomyoga.github.io/agh/agh.fly.js" charset="utf-8"></script>
  <script type="application/x-tex" id="tex-preamble">
  \documentclass{revtex}
  \def\tr{\operatorname{tr}}
  \begin{document}
  </script>
  <style>
  img.ring1 { height: 1.4em; vertical-align: middle; }
  img.ring2 { height: 2.8em; vertical-align: middle; }
  </style>
</head>
<body class="mwg-standard-layout aghfly-inline-math">
<nav>
  [
    <a href="../index.html">Top</a> -
    $CATEGORY<span class="mwg-nav-here">$TITLE</span>
  ]
</nav>

<h1>$TITLE</h1>
$CONTENT

<address class="mwg-address">
  <p>Copyright &copy; 2018, @akinomyoga
    <a href="https://github.com/akinomyoga/memo/issues">Issue</a>
    <a href="https://github.com/akinomyoga/memo/pulls">PR</a>
  </p>
</address>
</body>
</html>
EOF
}

update memo.css
update git.html
update index.html

generate phys/dft.html 密度汎関数法メモ
generate math/parity.html 偶奇性と分解

generate math/matrix-invariants.html 行列の不変量
update math/matrix-invariants-d1.png
update math/matrix-invariants-d11.png
update math/matrix-invariants-d111.png
update math/matrix-invariants-d1111.png
update math/matrix-invariants-d2.png
update math/matrix-invariants-d21.png
update math/matrix-invariants-d211.png
update math/matrix-invariants-d22.png
update math/matrix-invariants-d3.png
update math/matrix-invariants-d31.png
update math/matrix-invariants-d4.png

generate phys/glauber.html グラウバー模型
generate phys/fluid.html 流体力学の基本
generate phys/standard-error.html 標準誤差の評価
generate phys/scatter-variable.html 加速器実験の粒子の運動量

generate phys/cumulant.html 'キュムラント (統計)'

generate aghtex/test-bigl.html 'test \bigl, \bigr'
