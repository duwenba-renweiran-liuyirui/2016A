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

== 模型二\

(1) 风速36m/s 时，将风速带入模型一中的第二个模型里面\

(2) 最小重物质量模型\
约束条件：钢桶倾斜角度小于5度，锚链夹角小于16度\
风速为24时，满足约束条件\
风速为36时，不满足约束条件\
因此，需要改变重物球质量，以重物球的质量为搜索变量，进行二分查找，对海水深度18米进行逼近，得出最终质量。\
#figure(
  image("img/屏幕截图 2024-08-14 141452.png"), 
)

== 模型三\

以吃水深度最小、游动范围尽可能小为主要目标，同时要求钢桶倾斜角度小于5度，最后一节锚链与地面的夹角小于16度，由此即可确定锚链的型号。以锚链长度和重物球质量为搜索变量，利用遍历法，对满足最大水流速度和风速指标，水深 16m 时的钢桶角度和 20m 时的最后一节锚链与水平方向的夹角为约束的重力球质量与锚链长度进行求解。\

由于存在水流力的影响，需要对模型一的结果进行修正，修正结果如下：
#figure(
  image("img/屏幕截图 2024-08-14 110827.png"), 
)
\
\

$ cases(
cases( T_1 cos theta_1 =F_风 +374D h v^2 ,
        T_1 +G_"浮标" =F_浮),

cases( T_(i+1) cos theta_(i+1) =T_i cos theta_i ,
        T_(i+1) sin theta_(i+1) + G_i =T_i sin theta_i + F_浮 i),

cases( T_6 cos theta_6 =T_5 cos theta_5 +F_水 +F ,
        T_6 sin theta_6 =T_5 sin theta_5 -(G_球 -F_浮) -(G_5 -F_浮 5))
)
$
// 参考文献

#pagebreak()
// 附录
= 附录 A