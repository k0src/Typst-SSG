#import "@local/tssg-util:0.1.0": *

#set-base("https://k0src.github.io/Typst-SSG/")

#let layout(body) = {
  set page(
    width: 42em,
    height: auto,
    margin: (x: 2em, top: 2.5em, bottom: 3em),
    fill: rgb("#fefefe")
  )

  set text(
    font: "Junicode",
    size: 11pt,
    fill: rgb("#040608")
  )

  set heading(numbering: none)
  
  show heading.where(level: 1): it => [
    #v(1em)
    #text(size: 1.8em, weight: "bold", fill: rgb("#2c3e50"))[#it.body]
    #v(0.5em)
  ]

  show heading.where(level: 2): it => [
    #v(0.8em)
    #text(size: 1.4em, weight: "semibold", fill: rgb("#34495e"))[#it.body]
    #v(0.4em)
  ]

  show heading.where(level: 3): it => [
    #v(0.6em)
    #text(size: 1.15em, weight: "semibold", fill: rgb("#555"))[#it.body]
    #v(0.3em)
  ]

  show link: it => underline(text(fill: rgb("#2c3e50"))[#it])

  show raw.where(block: true): it => {
    set text(
      size: 1em, 
      fill: rgb("#333")
    ) if it.at(
      "label", 
      default: none
    ) != <tssg-code>
    
    if it.at(
      "label", 
      default: none
    ) != <tssg-code> {
      block(
        width: 100%,
        inset: 1em,
        radius: 0.2em,
        fill: rgb("#f5f5f5"),
        stroke: 0.5pt + rgb("#ddd"),
        it,
      )
    } else {
      it
    }
  }

  // Navbar
  block(
    width: 100%,
    inset: (bottom: 0.8em),
    [
      #grid(
        columns: (auto, 1fr),
        column-gutter: 1.5em,
        align: (left, right),
        [
          #text(size: 1.3em, weight: "bold", fill: rgb("#2c3e50"))[Typst SSG]
        ],
        [
          #grid(
            columns: 4,
            column-gutter: 1.5em,
            [#site-link("/", same-tab: true)[Home]],
            [#site-link("/about", same-tab: true)[About]],
            [#site-link("/blog", same-tab: true)[Blog]],
            [#site-link("/projects", same-tab: true)[Projects]]
          )
        ],
      )
      #line(length: 100%, stroke: 1pt + rgb("#e0e0e0"))
    ]
  )

  // Main content
  body

  // Footer
  v(2em)
  align(center)[
    #line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))
    #v(0.8em)
    #text(size: 0.9em, fill: rgb("#777"))[
      Built with Typst SSG • #datetime.today().display()
    ]
  ]
}