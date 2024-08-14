#import "@preview/mitex:0.2.4":*
#import "@preview/cumcm-muban:0.2.0": *
#import "@preview/fletcher:0.5.0" : *
#import "@preview/mitex:0.2.4" : *

#show: thmrules
//#set enum(number-align: start+top,numbering: "1.")
#set heading(numbering: "1.")
#show math.equation: set text(font: "Cambria Math")
#set par(first-line-indent: 2em)

#let fake-par = style(styles => {
  let b = par[#box()]
  let t = measure(b + b, styles);

  b
  v(-t.height)
})

#show heading: it => {
  it
  fake-par
}
#set text(
  font: "New Computer Modern",
  size: 8pt
)
#set page(
  paper: "a6",
  margin: (x: 1.8cm, y: 1.5cm),
)
#set par(
  justify: true,
  leading: 0.52em,
)




*2016高教杯题目*
= 模型建立与求解
== 问题一的模型建立与求解

=== 模型建立

在问题一中，题目给出了锚链的型号长度，选用重物球的质量，海水深度和海面风速，需要我们计算出对应风速下钢桶和各节钢管的倾斜角度，锚链形状，浮标的吃水深度和浮标的游动区域。

为了解决问题，我们通过对浮标，钢管以及系泊系统的其他部分进行力和力矩的平衡分析，得出方程组建立模型，再运用合适的求解方法即可得出问题的解。

首先，我们对浮标进行单独的受力分析。运用平面汇交力系的平衡条件，对浮标上的力进行分析，得出对应的方程。

接着，对第一节钢管进行受力分析，运用平面任意力系的平衡条件，分别对钢管上的力和力矩进行研究，得出对应的方程。

运用同样的分析思路，对钢管的其他部分进行力与力矩的平衡分析，得到对应的方程。

最后，联立得到的方程建立模型以便求解问题。

模型建立的流程图如所示。


==== 对浮标的受力分析
通过对浮标进行受力分析，可知浮标受4个力的作用，分别是$G_text("浮标")$（浮标自身的重力）,$F_text("浮")$（浮标所受的浮力）,$F_text("风")$（浮标所受的风力）,$T_text("1")$（第一根钢管对浮标的拉力）。
 
 受力分析图如 @figB 所示。
 #figure(
  image("img\联想截图_20240814103415.png", width: 80%),
  caption: [浮标受力分析],
) <figB>

经过受力分析，可得出以下方程。
$ cases(T_1 cos theta_1 = F_text("风") ,F_text("浮")= G_text("浮标")+T_1 sin theta_1 )      
#numbering("(1)", 1, ) \ $
==== 对钢管进行受力分析

*对第一节钢管上的力的分析*\

通过对第一节钢管进行受力分析，可知其受4个力的作用，分别是$G_text("钢管")$（钢管自身的重力）,$F_text("浮1")$（钢管所受的浮力）,$T_1$（浮标对第一节钢管的拉力 ）,$T_2$（第二节钢管对第一节钢管的拉力）。

受力分析图如@figC 所示。
#figure(
  image("img\联想截图_20240814103435.png", width: 80%),
  caption: [第一节钢管受力分析],
) <figC>
经过受力分析，可得出以下方程。
$ cases(T_1 cos theta_1=T_2 cos theta_2,F_text("浮1")+T_1 sin theta_1=G_text("钢管")+T_2 sin theta_2 ) #numbering("(1)", 2, ) \  $

对第一节钢管上力矩的分析\

在对钢管上的力进行分析的基础上，进一步对其力矩进行分析，分别以钢管上的1，2两点作为节点研究力矩。受力分析图如@figD 所示。
#figure(
  image("img\联想截图_20240814103452.png", width: 80%),
  caption: [第一节钢管力矩分析],
) <figD>
经过分析，可得出以下方程。
$ cases(T_1sin(theta_1-phi_1)L_1+frac(1,2)F_text("浮1")cos phi_1L_1=frac(1,2)G_text("钢管")cos phi_1 L_1 text("  ，以1为取矩点"),T_2sin(phi_1-theta_2)L_1+frac(1,2)G_text("钢管")cos phi_1 L_1=frac(1,2)F_text("浮1")cos phi_1L_1 text("  ，以2为取矩点"))   #numbering("(1)", 3, ) \ $

对于其他钢管的力矩平衡求解时，也可将第一节钢管的力矩分析进行推广，分别以节点
i+1 和节点 i 作为参考点，对钢管的力矩进行力矩平衡性分析可得到钢管与海平面夹角φi
(i = 1,2,3,4)的递推公式：
$ tan phi_i=frac(2T_i sin theta_i+F_text("浮i")-G_i,2T_i cos theta_i) #numbering(" (1)", 4, )\  $

==== 对于其他部分的分析
分析过程与钢管相同，先进行受力分析，在进行力矩分析，得到对应方程后，将上述的力学分析和和力矩平衡的递推公式进行整理，可得：

$ cases(cases(T_1cos theta_1=0.625D(2-h)v^2,T_1sin theta_1=rho_text("海水")g pi r^2 h -m_text("浮标")g),cases(T_(i+1) cos theta_(i+1) =T_i cos theta_i,T_(i+1) sin theta_(i+1)=T_i sin theta_i- (G_i-F_text("浮i"))
),cases(T_6cos theta_6=T_5cos theta_5,T_6sin theta_6=T_5sin theta_5-(G_text("球")-F_text("浮球"))-(G_5-F_text("浮5"))),phi_i=arctan(frac(2T_i sin theta_i -(G_i-F_text("浮i")),2T_i cos theta_i),)text("i=1，2，3，...，n"),H=Sigma_(i=1)^n L_i sin phi_i +h,R=Sigma_(i=1)^n L_i cos phi_i) #numbering(" (1)", 5, )\ $

=== 模型求解
==== 求解方法
==== 求解步骤
==== 求解结果
====  模型检验
== 问题二的模型建立与求解
=== 模型建立
在问题二中设有两小问，第一小问中，题目是在问题一的基础上将风速赋值为36m/s，对钢桶和各节钢管的倾斜角度、锚链形状和浮标的游动区域进行求解。第二小问中，题目要求我们调节重物球的质量，使得钢桶倾斜角度不超过5#sym.degree，锚链在锚点与海床的夹角不超过16#sym.degree。

为了求解第一小问，我们将风速36m/s带入问题一中所建立的方程组中，即可求得钢桶和各节钢管的倾斜角度、锚链形状和浮标的游动区域。

为了求解第二小问，我们需要改变重物球的质量来满足题目的条件，通过/*以重物球的质量为搜索变量,进行二分查找，对海水深度18米进行逼近，最终得出小球质量  ？？是否为求解方法？？*/建立约束方程，并运用合适的算法对模型进行求解得出小球质量。
==== 第一小问模型建立
将风速36m/s带入到问题一的数学模型中（如下所示）即可求解。
$ cases(cases(T_1cos theta_1=0.625D(2-h)v^2,T_1sin theta_1=rho_text("海水")g pi r^2 h -m_text("浮标")g),cases(T_(i+1) cos theta_(i+1) =T_i cos theta_i,T_(i+1) sin theta_(i+1)=T_i sin theta_i- (G_i-F_text("浮i"))
),cases(T_6cos theta_6=T_5cos theta_5,T_6sin theta_6=T_5sin theta_5-(G_text("球")-F_text("浮球"))-(G_5-F_text("浮5"))),phi_i=arctan(frac(2T_i sin theta_i -(G_i-F_text("浮i")),2T_i cos theta_i),)text("i=1，2，3，...，n"),H=Sigma_(i=1)^n L_i sin phi_i +h,R=Sigma_i=1^n L_i cos phi_i) #numbering(" (1)", 6, )\ $
==== 第二小问模型建立
可知在该小问中，要求钢桶倾斜角度不超过5#sym.degree，锚链在锚点与海床的夹角不超过16#sym.degree。由上一小问可知当风速为36m/s时并不满足该条件，所以我们需要改变小球的质量，建立新的约束方程。

目标函数：$M i n m_text("球")$

约束条件：
$ cases(cases(T_1cos theta_1=0.625D(2-h)v^2,T_1sin theta_1=rho_text("海水")g pi r^2 h -m_text("浮标")g),cases(T_(i+1) cos theta_(i+1) =T_i cos theta_i,T_(i+1) sin theta_(i+1)=T_i sin theta_i- (G_i-F_text("浮i"))
),cases(T_6cos theta_6=T_5cos theta_5,T_6sin theta_6=T_5sin theta_5-(G_text("球")-F_text("浮球"))-(G_5-F_text("浮5"))),phi_i=arctan(frac(2T_i sin theta_i -(G_i-F_text("浮i")),2T_i cos theta_i),)text("i=1，2，3，...，n"),H=Sigma_(i=1)^n L_i sin phi_i +h,R=Sigma_(i=1)^n L_i cos phi_i,phi_215#sym.lt.eq.slant 16#sym.degree,90#sym.degree -phi_5 lt.eq.slant 5#sym.degree) #numbering(" (1)", 7, )\ $

约束方程：
$ M i n m_text("球")\ s.t.
cases(cases(T_1cos theta_1=0.625D(2-h)v^2,T_1sin theta_1=rho_text("海水")g pi r^2 h -m_text("浮标")g),cases(T_(i+1) cos theta_(i+1) =T_i cos theta_i,T_(i+1) sin theta_(i+1)=T_i sin theta_i- (G_i-F_text("浮i"))
),cases(T_6cos theta_6=T_5cos theta_5,T_6sin theta_6=T_5sin theta_5-(G_text("球")-F_text("浮球"))-(G_5-F_text("浮5"))),phi_i=arctan(frac(2T_i sin theta_i -(G_i-F_text("浮i")),2T_i cos theta_i),)text("i=1，2，3，...，n"),H=Sigma_(i=1)^n L_i sin phi_i +h,R=Sigma_i=1^n L_i cos phi_i,phi_215#sym.lt.eq.slant 16#sym.degree,90#sym.degree -phi_5 lt.eq.slant 5#sym.degree) #numbering(" (1)", 8, )\ $




=== 模型求解
==== 求解方法
==== 求解步骤
==== 求解结果
==== 模型检验
== 问题三的模型建立与求解
=== 模型建立
在问题三中，题目结合实际情况，考虑了潮汐等因素的影响，给出布放海域的实际深介于16#sym.tilde.basic 20m之间，且考虑了海水的流动，给出海水速度最大可达到1.5m/s,风速最大可达到36m/s。题目要求我们在考虑实际情况的基础上，对不同情况下钢桶、钢管的倾斜角度、锚链形状、浮标的吃水深度和游动区域进行分析。

为了求解该问题，我们以吃水深度最小、游动范围尽可能小为主要目标，建立对应的约束方程，并运用合适的求解方法得出对应解。
==== 模型的修正//修正需不需要在进行受力分析图片
在问题三中，由于存在水流力的影响，对相应的模型进行修正。
$ cases(T_1 cos theta_1 = F_text("风")+374D h v^2 ,F_text("浮")= G_text("浮标")+T_1 sin theta_1 )      
#numbering("   (1)", 9, ) \ $

$ cases(T_(i+1) cos theta_(i+1) =T_i cos theta_i+F_text("水"),T_(i+1) sin theta_(i+1)=T_i sin theta_i- (G_i-F_text("浮i"))
)#numbering("   (1)", 10, ) \ $

$ cases(T_6cos theta_6=T_5cos theta_5+F_text("水5")+F_text("水球"),T_6sin theta_6=T_5sin theta_5-(G_text("球")-F_text("浮球"))-(G_5-F_text("浮5"))) #numbering("   (1)", 11, ) \ $

==== 约束方程的建立
$ cases(cases(T_1cos theta_1=0.625D(2-h)v^2+374D h v^2,T_1sin theta_1=rho_text("海水")g pi r^2 h -m_text("浮标")g),cases(T_(i+1) cos theta_(i+1) =T_i cos theta_i+F_text("水"),T_(i+1) sin theta_(i+1)=T_i sin theta_i- (G_i-F_text("浮i"))
),cases(T_6cos theta_6=T_5cos theta_5+F_text("水5")+F_text("水球"),T_6sin theta_6=T_5sin theta_5-(G_text("球")-F_text("浮球"))-(G_5-F_text("浮5"))),phi_i=arctan(frac(2T_i sin theta_i -(G_i-F_text("浮i")),2T_i cos theta_i),)text("i=1，2，3，...，n"),H=Sigma_(i=1)^n L_i sin phi_i +h,R=Sigma_(i=1)^n L_i cos phi_i,phi_n#sym.lt.eq.slant 16#sym.degree,90#sym.degree -phi_5 lt.eq.slant 5#sym.degree,16#sym.lt.eq.slant H#sym.lt.eq.slant 20 ) #numbering(" (1)", 12, )\ $


=== 模型求解
==== 求解方法
==== 求解步骤
==== 求解结果
==== 模型检验











