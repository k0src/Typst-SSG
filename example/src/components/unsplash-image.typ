#let unsplash-image(
  image-path,
  caption: none,
  photographer: none,
  photographer-url: none,
  photo-url: none,
  width: 100%,
) = {
  let caption = [
    #if caption != none [
      #caption
      #v(0.1em)
    ]
    #if photographer != none [
      #text(size: 0.85em, fill: rgb("#606060"))[
        Photo by #if photographer-url != none [
          #link(photographer-url)[#photographer]
        ] else [
          #photographer 
        ] on #if photo-url != none [
          #link(photo-url)[Unsplash]
        ] else [
          #link("https://unsplash.com")[Unsplash]
        ]
      ]
    ]
  ]
  align(
    center,
    [
      #image(image-path, width: width)
      #caption
    ],
  )
}
