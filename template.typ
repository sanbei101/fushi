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
#let choices(a: str, b: str, c: str, d: str) = layout(bounds => {
  context {
    let raw-opts = (a, b, c, d)
    let labeled-opts = raw-opts
      .enumerate()
      .map(e => {
        let (i, content) = e
        let label = str.from-unicode(65 + i) + ". "
        label + content
      })

    let col-gap = 2em
    let row-gap = 0.8em

    let gap-width = measure(h(col-gap)).width
    let widths = labeled-opts.map(opt => measure(opt).width)

    let max-width = widths.fold(0pt, calc.max)

    let fits-4-cols = max-width * 4 + gap-width * 3 < bounds.width

    let fits-2-cols = max-width * 2 + gap-width < bounds.width

    if fits-4-cols {
      grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        gutter: col-gap,
        ..labeled-opts
      )
    } else if fits-2-cols {
      grid(
        columns: (1fr, 1fr),
        gutter: row-gap,
        column-gutter: col-gap,
        ..labeled-opts
      )
    } else {
      grid(
        columns: 1,
        gutter: row-gap,
        ..labeled-opts
      )
    }
  }
})

#let choice-question(
  id,
  stem,
  a: str,
  b: str,
  c: str,
  d: str,
) = {
  grid(
    columns: (auto, 1fr),
    column-gutter: 0.5em,
    [#id.],
    [
      #stem
      #v(0.2em)
      #choices(
        a: a,
        b: b,
        c: c,
        d: d,
      )
    ],
  )
  v(1em)
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
