#import "@local/tssg-util:0.1.0": *

#page-title("Example Site - Home")

= Welcome to Typst SSG

Typst SSG is a static site generator that uses #link("https://typst.app")[Typst] to create beautiful websites, compiling Typst files into PDFs that are then converted into static HTML pages.

== Features

This example site showcases some of the features of Typst SSG:

- *Markup and typography* powered by Typst, including basic page layout elements like headings, links, and lists, as well as more technical features like graphs, tables, and code blocks.
- *Customizable styles* using Typst's styling system.
- *Folder-based routing*; each folder in the `src/pages` directory corresponds to a route on the site.
- *Static asset handling*; images and other assets can be placed in the `src/assets` directory and referenced in pages.
- *Internal navigation* using the #link("https://github.com/k0src/Typst-SSG-Util-Package")[Typst SSG utility package] for linking between pages. Navigation can also be enabled by enabling the sidebar and/or table of contents in the site configuration.
- *Easy deployment*; the generated static site can be deployed to any static hosting service.

== Quick Example

Pages are compiled to PDFs, so all Typst features are available. For example, some display math:

$
  H(A) = sum_(w_i > 0) w_i h(a_i) = sum_(w_i > 0) w_i log_2 1/w_i = - sum_(w_i > 0) w_i log_2 w_i
$

A table:

#align(center,
  table(
    columns: 4,
    align: left,
    [*Symbol*],[*Probability*],[*Huffman Code*],[*Code Length*],
    [$a$],[$12\/80$],[`101`],[3],
    [$b$],[$3\/80$],[`01011`],[5],
    [$c$],[$9\/80$],[`011`],[3],
    [$d$],[$6\/80$],[`1100`],[4],
    [$e$],[$13\/80$],[`111`],[3],
  )
)

And a code block:

```cpp
std::string huffmanDecoding(const std::string& encoded, HuffmanNode* root) {
    std::string decoded;
    HuffmanNode* current = root;

    for (char bit : encoded) {
        if (bit == '0') {
            current = current->left;
        } else if (bit == '1') {
            current = current->right;
        }

        if (!current->left && !current->right) {
            decoded += current->c;
            current = root;
        }
    }
    return decoded;
}
```

== Getting Started

Check out the #site-link("/blog", same-tab: true)[Blog] for some example articles, or explore the #site-link("/projects", same-tab: true)[Projects] page to see different layout examples.

Visit the #site-link("/about", same-tab: true)[About] page to learn more about this example site.