#let card(title: none, meta: none, body) = {
  block(
    width: 100%,
    inset: 1.2em,
    radius: 0.2em,
    fill: rgb("#fafafa"),
    stroke: 0.5pt + rgb("#e0e0e0"),
    [
      #if title != none [
        #text(size: 1.1em, weight: "semibold", fill: rgb("#1a1a1a"))[#title]
        #v(0.25em)
      ]

      #if meta != none [
        #text(size: 0.85em, fill: rgb("#666666"))[#meta]
        #v(0.05em)
      ]

      #body
    ]
  )
}
