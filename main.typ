#import "@preview/touying:0.4.2":  *
#import "@preview/cetz:0.2.2":  *





#set math.equation(numbering: "(1.1)")
#set text(lang: "zh")
#show strong: set text(font: "SimHei")
// Themes: default, simple, metropolis, dewdrop, university, aqua
#let s = themes.aqua.register(aspect-ratio: "16-9")
#let s = (s.methods.info)(
  self: s,
  title: [系泊系统设计],
  subtitle: [Subtitle],
  author: [杜文霸],
  date: datetime.today(),
  institution: [Institution],
)
#let (init, slides, touying-outline, alert, speaker-note) = utils.methods(s)
#show: init

#show strong: alert

#let (slide, empty-slide, title-slide, focus-slide) = utils.slides(s)
#show: slides


= 问题背景
== 问题描述
单浮筒系泊系统的简单示意图如下
#figure(
  image("img/示意图.png" ,alt: "示意图", height: 100%-5em),
  caption: "问题示意图"
)

== 符号说明
// ======== 符号说明 ===========
#figure(
  table(
    columns: (20%,60%),
    // row-gutter: (9pt,9pt,9pt,9pt),
    column-gutter:1pt,
    gutter: 5pt,
    align: (center + horizon,),

    stroke: none,
    table.hline(),
    table.header(
      [ dot 符号 dot ],[ dot 说明 dot ]
    ),
    table.hline(),
    v(0.2em),v(0.2em),
    [$h$],[浮筒的吃水深度],
    [$M$],[整个系统的总质量],
    [$V_没$],[锚链、钢管、钢桶、重物球的总体积],
    v(0.2em),v(0.2em),
    table.hline(),
  ),
)


= 问题一建模

== 整体受力分析

#grid(align: (left+top,center+horizon),columns: (75%,20%), gutter: 1em)[
  对于浮标、锚链、钢管、钢桶以及重物球组成的系统，其受到的外力如 @受力分析1 所示。分别是：

  - 风对系统的作用力$F_风 = 0.625 times S v^2$，其中$S$为物体在风向发平面上的投影面积，$v$为风速。
  - 锚链的作用力$F_锚 $，其与水平方向的夹角设为 $beta$ 。
  - 系统的总重力$M g$，其中$M$为系统的总质量，$g$为重力加速度。
  整个系统在静止状态下受力平衡，即：
  $ 0.625 times 2(2-h) v^2 - F_锚 cos beta = 0 $
  $ rho g (pi h + V_没) - F_锚 sin beta - M g = 0 $
][
#figure(
  canvas(length: 1.5cm,{
  import draw:  *
  circle((0,0),radius: 0.1,fill: black)
  // content((-1.2,0.3),[系统整体])

  line((0,0),(0deg,2))
  mark((0,0),(0deg,2), symbol: "stealth", scale: 1, fill: black)
  content((2,-0.3),[$F_text("风")$])

  line((0,0),(30deg,-2))
  mark((0,0),(30deg,-2), symbol: "stealth", scale: 1, fill: black)
  content((-2,-1.5),[$F_text("锚")$])
  
  line((0,0),(90deg,-2))
  mark((0,0),(90deg,-2), symbol: "stealth", scale: 1, fill: black)
  content((90deg,-2.5),[$M g$])

  line((0,0),(90deg,2))
  mark((0,0),(90deg,2), symbol: "stealth", scale: 1, fill: black)
  content((90deg,2.5),[$rho g V$])
}),
  caption: "浮标与锚链钢管钢桶的整体受力分析",
  gap: 2em
)<受力分析1>]

== 浮标受力分析

#grid(align: (left+top,center+horizon), columns: (75%,20%), gutter: 1em)[
  对于浮标，其受到的外力如 @受力分析2 所示。分别是：

  - 风对系统的作用力$F_风 = 0.625 times S v^2$，与上文整个系统收到的风力相同。
  - 钢管对浮标的作用力$F_管 $，其与水平方向的夹角设为 $beta$ 。
  - 系统的总重力$M g$，其中$M$为系统的总质量，$g$为重力加速度。
  整个系统在静止状态下受力平衡，即：
  $ 0.625 times 2(2-h) v^2 - F_管 cos gamma = 0 $
  $ rho g (pi h) - F_管 sin gamma - m_标 g = 0 $
][
#figure(
  canvas(length: 1.5cm,{
  import draw:  *
  circle((0,0),radius: 0.1,fill: black)
  // content((-1.2,0.3),[系统整体])

  line((0,0),(0deg,2))
  mark((0,0),(0deg,2), symbol: "stealth", scale: 1, fill: black)
  content((2,-0.3),[$F_text("风")$])

  line((0,0),(45deg,-2))
  mark((0,0),(45deg,-2), symbol: "stealth", scale: 1, fill: black)
  content((-2,-1.5),[$F_text("管")$])
  
  line((0,0),(90deg,-2))
  mark((0,0),(90deg,-2), symbol: "stealth", scale: 1, fill: black)
  content((90deg,-2.5),[$m_标 g$])

  line((0,0),(90deg,2))
  mark((0,0),(90deg,2), symbol: "stealth", scale: 1, fill: black)
  content((90deg,2.5),[$rho g V$])
}),
  caption: "浮标受力分析",
  gap: 2em
)<受力分析2>]

== 锚链、钢管、钢桶、重物球系统的受力分析


#grid(align: (left+top,center+horizon), columns: (75%,20%), gutter: 1em)[
  对于锚链、钢管、钢桶以及重物球组成的系统，其受到的外力如 @受力分析3 所示。分别是：

  - 整个系统的浮力$rho g V_没$，其中$rho$为海水密度，$g$为重力加速度，$V_没$为整个系统的总体积。
  - 整个系统的总重力$m_没 g$，其中$m_桶$为系统的总质量。
  - 锚点对系统的作用力$F_锚 $，其与水平方向的夹角设为 $beta$ 。
  - 浮标对系统的作用力$-F_管 $，是钢管对浮标作用力的反作用力，大小与$F_管$相同方向相反 。

系统受力平衡，即：
  $ rho g V_没  - m_没 g + F_管 sin gamma - F_锚 sin beta = 0 $
  $ F_管 cos gamma - F_锚 cos beta = 0 $

][
#figure(
  canvas(length: 1.5cm,{
  import draw:  *
  circle((0,0),radius: 0.1,fill: black)
  // content((-1.2,0.3),[系统整体])

  line((0,0),(60deg,2))
  mark((0,0),(60deg,2), symbol: "stealth", scale: 1, fill: black)
  content((1.5,2),[$-F_text("管")$])

  line((0,0),(45deg,-2))
  mark((0,0),(45deg,-2), symbol: "stealth", scale: 1, fill: black)
  content((-2,-1.5),[$F_text("锚")$])
  
  line((0,0),(90deg,-2))
  mark((0,0),(90deg,-2), symbol: "stealth", scale: 1, fill: black)
  content((90deg,-2.5),[$m_没 g$])

  line((0,0),(90deg,2))
  mark((0,0),(90deg,2), symbol: "stealth", scale: 1, fill: black)
  content((90deg,2.5),[$rho g V_没$])
}),
  caption: "锚链、钢管、钢桶、重物球系统的受力分析",
  gap: 2em
)<受力分析3>]

== 求解方程组

其中，各常数的值如下： 
#align(center)[
#table(align: center+horizon, 
  columns: (20%,auto,60%), gutter: 1em,
  stroke: none,
  [总质量$M$],[$"kg"$],[$1140 + M_链 + M_球 $],
  [$m_没$],[$"kg"$],[$140 + M_链 + M_球 $],
  [$V_没$],[$m^3$],[$0.025 pi + V_链 + V_球 $],
  [风速$v$],[$m \/ s$],[$12 "or" 24$],
  [海水密度$rho$],[$"kg" \/ m^3$],[$1025$],
  [重物球质量$M_球$],[$"kg"$],[1200]
)]




