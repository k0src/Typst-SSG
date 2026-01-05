#import "@local/tssg-util:0.1.0": *

#page-title("Example Site - Euler's Identity")

= Euler's Identity

#text(size: 0.9em, fill: rgb("#666"))[
  Published: #format-date(3, 1, 2025) #h(0.25em) #sym.bullet #h(0.25em) 4 min read
]

#divider()

Euler's Identity is often cited as an example of mathematical beauty. It is expressed by the equation:

$
  e^(i pi) + 1 = 0
$

where:
+ $e$ is Euler's number, approximately equal to 2.71828, and is the base of natural logarithms.
+ $i$ is the imaginary unit, defined as $sqrt(-1)$, the foundation of complex numbers.
+ $pi$ is the ratio of a circle's circumference to its diameter, approximately equal to 3.14159.
+ $1$ and $0$ are the multiplicative and additive identities.

== Derivation from Euler's Formula

Euler's Identity can be derived from Euler's formula, which states that for any real number $x$:

$
  e^(i theta) = cos(theta) + i sin(theta)
$

By substituting $theta$ with $pi$, we get:

$
  e^(i pi) &= cos(pi) + i sin(pi) \
           &= -1 + i dot 0 \
           &= -1
$

Adding $1$ to both sides yields Euler's Identity:

$
  e^(i pi) + 1 = 0
$

== Geometric Interpretation

In the complex plane, $e^(i theta)$ traces out a unit circle as $theta$ varies. The point at $theta = pi$ corresponds to $-1$ on the real axis.

#align(center)[
  #box(
    width: 80%,
    stroke: 0.5pt + rgb("#ddd"),
    inset: 1em,
    fill: rgb("#fafafa"),
    [
      #v(0.5em)
      *Unit Circle Representation*
      #v(0.5em)
      $
        "Re"(e^(i theta)) &= cos(theta) \
        "Im"(e^(i theta)) &= sin(theta)
      $
      #v(0.5em)
    ]
  )
]

== Significance

Euler's Identity is celebrated for its elegance, as it connects five fundamental mathematical constants in a single equation. It has implications in various fields, including engineering, physics, and signal processing, particularly in the analysis of waveforms and oscillations.

== Applications

Euler's Identity and Euler's formula are widely used in:
+ Electrical engineering, particularly in the analysis of alternating current (AC) circuits.
+ Quantum mechanics, where complex exponentials describe wave functions.
+ Signal processing, for transforming signals between time and frequency domains using Fourier transforms.
+ Control theory, in the design and analysis of control systems.
+ Vibrations and wave analysis, where they help model oscillatory systems.
+ Computer graphics, for rotations and transformations in 2D and 3D spaces.

== Related Formulas

Euler's formula leads to many other useful identities:

$
  cos(theta) &= (e^(i theta) + e^(-i theta)) / 2 \
  sin(theta) &= (e^(i theta) - e^(-i theta)) / (2i)
$

These allow us to express trigonometric functions in terms of exponentials, which is important in various mathematical and engineering applications.