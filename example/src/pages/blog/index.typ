#import "@local/tssg-util:0.1.0": *
#import "../../components/card.typ": card

#page-title("Example Site - Blog")

= Blog

This is the #c("/blog") page. Here you will find links to some example articles written in Typst.

#v(1em)

#card(
  title: "The Pallas's Cat",
  meta: [#format-date(5, 1, 2025) #h(0.25em) #sym.bullet #h(0.25em) 4 min read],
  [
    Learn about the elusive Pallas's cat, its habitat, behavior, and conservation status.
    
    #site-link("/blog/pallas-cat", same-tab: true)[Read more #sym.arrow]
  ]
)

#v(1em)

#card(
  title: "Euler's Identity",
  meta: [#format-date(3, 1, 2025) #h(0.25em) #sym.bullet #h(0.25em) 4 min read],
  [
    Exploring one of the most beautiful equations in mathematics and its connection to complex analysis.
    
    #site-link("/blog/eulers-identity", same-tab: true)[Read more #sym.arrow]
  ]
)
