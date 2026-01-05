#import "@local/tssg-util:0.1.0": *
#import "../components/card.typ": card

#page-title("Example Site - About")

= About This Example Site

This example site demonstrates the capabilities of Typst SSG. Typst SSG takes #c(".typ") files and compiles them into PDFs, which are then converted into static HTML pages using a custom PDFium-based PDF viewer, which supports text selection and clickable links.

== Technical Specifications

#table(
  columns: (auto, 1fr),
  inset: 0.8em,
  stroke: 0.5pt + rgb("#ddd"),
  fill: (col, row) => if row == 0 { rgb("#f5f5f5") } else { white },
  [*Feature*], [*Description*],
  [Font],
  [#link("https://junicode.sourceforge.io/")[Junicode] (main text), #link("https://www.jetbrains.com/lp/mono/")[JetBrains Mono (code)]],

  [Page Width], [`42em`],
  [Margins], [`2em` horizontal, `2.5em` top, `3em` bottom],
  [Background], [Off-white (`#fefefe`)],
  [Link Color], [Blue (`#2980b9`)],
  [Rendering], [PDFium WASM in browser],
)

== Component Example

Custom "components" can be created by defining Typst functions to render specific elements with pre-defined styles. For example, this site uses a #c("card") component defined in #c("src/components/card.typ") to create styled content blocks.

#code-block(
```typst
#import "../components/card.typ": card

#card(
  title: "Card Title",
  meta: "Card Meta Info",
)[
  Card component example.
]
```
)

#card(
  title: "Card Title",
  meta: "Card Meta Info",
)[
  Card component example.
]

== Layout Files 

Layout files can be defined to create consistent structures across multiple pages, by defining a #c("#let layout(body) = {...}") function that wraps the page content with specific styles and elements. #c("layout") functions are defined in an #c("index.typ") file within the directory of the pages that should use that layout.

The file tree gets read from #c("src/pages"); for each page, the parent directories are chalked for #c("index.typ") files that define #c("layout") functions. There are three layout inheritance modes (which can be set in #c("tssg.config.js")):
+ #c("none"): only checks the immediate directory for a layout file.
+ #c("fallback"): uses the closest layout file found in the directory hierarchy.
+ #c("merge"): merges all layout functions from the page up to the root. The #c("set") and #c("show") functions from all layout files are applied, with the closest layout file taking precedence.

In this example site, the #c("layoutInheritance") mode is set to #c("merge") in the #c("tssg.config.js") file. The #c("index.typ") file in the #c("src/pages") directory defines the base layout for all pages. The #c("blog/") and #c("projects/") sub-directories each have their own #c("index.typ") files that define specific layouts for the pages within these directories, which are merged with the base layout.

=== Layout File Example

The #c("index.typ") file in the root #c("src/pages/") directory defines the base layout for all pages. The #c("layout") function takes the page content as the #c("body") parameter and applies #c("show") and #c("set") rules to style various elements, as well as defining elements that should appear on all pages. Note that the content elements such as the navbar are _not_ inherited by sub-directory layouts; only the #c("set") and #c("show") rules are merged.
Setting page properties:

#code-block(
```typst
set page(
  width: 42em,
  height: auto,
  margin: (x: 2em, top: 2.5em, bottom: 3em),
  fill: rgb("#fefefe")
)
```
)

Setting text properties, heading styles, and link styles: 

#code-block(
```typst
set text(
  font: "Junicode",
  size: 11pt,
  fill: rgb("#040608")
)

set heading(numbering: none)

// ...

show link: it => underline(text(fill: rgb("#2c3e50"))[#it])
```
)

Defining how raw code blocks should be displayed:

#code-block(
```typst
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
```
)

The above rule defines styles for all raw code blocks, giving them a light gray background, some padding, and a border. It excludes code blocks labeled #c("<tssg-code>"), which are used internally by the #c("#code-block") and should not be styled.

== CSS Styling

Most styling is done within the Typst document itself. However, to change the overall appearance of your site, you can create a CSS file in the root of a directory.

For example, the #c("index.css") file in the #c("src/pages/") directory changes the background color of the entire page, to match the Typst page background color:

```css
#pdf-container {
  background: #fefefe;
}
```

== Getting Started

To create your own site using Typst SSG:
+ Install the Typst SSG framework.
+ Download the Typst SSG utility package.
+ Run #c("tssg init") to set up a new project.
+ Create your pages in the #c("src/pages") directory as #c(".typ") files.
+ Run #c("tssg dev") to start a local development server and #c("tssg build") to generate the static site.
+ Deploy the generated static files to a hosting service.

== Documentation

- #link("https://typst.app/docs")[Typst Documentation]
- #link("https://github.com/k0src/Typst-SSG")[Typst SSG Documentation]

#divider()

_For more examples, visit the #site-link("/blog", same-tab: true)[Blog] or check out the #site-link("/projects", same-tab: true)[Projects] page._
