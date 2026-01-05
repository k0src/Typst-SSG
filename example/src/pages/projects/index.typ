#import "@local/tssg-util:0.1.0": *
#import "../../components/card.typ": card

#page-title("Example Site - Projects")

= Projects

This is the #c("/projects") page. This page showcases various layout possibilities using Typst SSG.

#v(1em)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  row-gutter: 1.5em,

  card(
    title: "Portfolio Page",
    meta: "Layout Example",
    [
      Portfolio design showcasing work with images and descriptions.

      #site-link("/projects/portfolio", same-tab: true)[View project #sym.arrow]
    ]
  ),

  card(
    title: "Technical Report",
    meta: "Layout Example",
    [
      Technical report with figures, tables, and appendices.

      #site-link("/projects/technical-report", same-tab: true)[View project #sym.arrow]
    ]
  ),
)
