#import "@preview/cuti:0.4.0": show-cn-fakebold

#let blank(width: 4.5em) = box(
  width: width,
  stroke: (bottom: 0.5pt),
  outset: (bottom: 2pt),
)
#let judge(content) = {
  enum.item[
    #content
    #box(width: 1fr, repeat[ . ])
    #h(0.5em)
    (#h(1.5em))
  ]
}
#let paper(
  year: int,
  body,
) = {
  set text(font: ("Times New Roman", "SimSun"), size: 12pt)
  set page(margin: (x: 1cm, y: 1.5cm))
  show: show-cn-fakebold

  align(center)[
    #text(size: 22pt, weight: "bold")[南京农业大学] \
    #text(size: 18pt, weight: "bold")[#year 年硕士研究生入学考试复试试题]
  ]

  grid(
    columns: (1fr, 1fr, 1fr),
    align: center + bottom,
    [科目代码:#box(width: 60pt, stroke: (bottom: 0.6pt), inset: 3pt)[081201]],
    [科目名称:#box(width: 80pt, stroke: (bottom: 0.6pt), inset: 3pt)[作物育种学]],
    [满分:#box(width: 60pt, stroke: (bottom: 0.6pt), inset: 3pt)[150 分]],
  )
  v(1em)

  block(
    width: 100%,
    stroke: 1pt,
    inset: (top: 15pt, left: 20pt, bottom: 30pt, right: 20pt),
    breakable: true,
  )[
    #set par(leading: 1.5em)
    #body
  ]
}
