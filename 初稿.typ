#import "@preview/cumcm-muban:0.2.0": *
#show: thmrules

#show: cumcm.with(
  title: "系泊系统的设计",
  problem-chosen: "A",
  team-number: "1234",
  college-name: " ",
  member: (
    A: " ",
    B: " ",
    C: " ",
  ),
  advisor: " ",
  date: datetime(year: 2023, month: 9, day: 8),

  cover-display: false,

  abstract: [
    摘要
  ],
  keywords: ("Typst", "模板", "数学建模"),
)

// 正文内容




#set text(lang: "zh")

= 系泊系统的设计
== 模型一
第一步：对浮标进行分析

单结锚链所受拉力$T_1$、风力$F_风$、重力$F_浮$、浮力$F_浮$
#figure(
  image("img/屏幕截图 2024-08-13 170454.png"), caption: [浮标受力分析]
)
$ cases( T_1 cos theta =F_风 ,
        T_1 +G_"浮标" =F_浮
)
$

第二步：对钢管进行受力分析
#figure(
  image("img/屏幕截图 2024-08-13 171449.png"), caption: [单结钢管受力分析]
)
$ cases( T_1 cos theta 1 =T_2 cos theta 2 ,
        T_2 sin theta 2 +G_"浮标" =F_浮 + T_1 sin theta 1
)
$\
\

第三步：对钢管进行力矩分析\
由于钢管是刚性物体，受到多个力的作用，所以需要对钢管的力矩的平衡性进行分析

#figure(
  image("img/屏幕截图 2024-08-13 172411.png"), caption: [单结钢管力矩分析]
)

$ cases( T_(i+1) cos theta_(i+1) =T_i cos theta_i ,
        T_(i+1) sin theta_(i+1) + G_i =T_i sin theta_i + F_浮 i
)
$
对于其他钢管的力矩平衡求解时，也可将第一节钢管的力矩分析进行推广，分别以节点 i+1 和节点 i 作为参考点，对钢管的力矩进行力矩平衡性分析可得到钢管与海平面夹角φi
(i = 1,2,3,4)的递推公式：

$ tan phi = frac(2T_i sin theta_i +F_浮_i-G_i , 2T_i cos theta_i) $

第四步：其他部分

分析过程与钢管相同，先进行受力分析，在进行力矩分析，详细结构参考优秀论文\

将上述的力学分析和和力矩平衡的递推公式进行整理，可得：
#figure(
  image("img/屏幕截图 2024-08-13 175259.png"), 
)

// 参考文献

#pagebreak()
// 附录
= 附录 A