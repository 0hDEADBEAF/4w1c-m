#let book_title = [Analyse et simulation du déterminisme]

#let book(doc) = {
  set document(
    title: book_title,
    author: "0xdeadbeaf",
    description: "Un livre où j'explore de manière intuitive ma perception de ce qu'est le déterminisme",
    date: datetime.today(),
  )
  set enum(
    tight: true,
    numbering: "1.1. ",
    start: auto,
    full: true,
    reversed: false,
    indent: 0pt,
    body-indent: 0.1em,
    spacing: auto,
    number-align: end + top,
  )
  set figure(
    alt: "Unset",
    placement: auto,
    scope: "column",
    kind: auto,
    supplement: auto,
    numbering: "1",
    gap: 0.65em,
    outlined: true,
  )
  set footnote(numbering: "1")
  set heading(
    level: auto,
    depth: 1,
    offset: 0,
    numbering: none,
    supplement: [Chapitre],
    outlined: true,
    bookmarked: true,
    hanging-indent: auto,
  )
  set list(
    tight: true,
    marker: ([–], [•]),
    indent: 0pt,
    body-indent: 0.1em,
    spacing: auto,
  )
  set outline(title: auto, target: heading, depth: none, indent: auto)
  set par(
    leading: 0.65em,
    spacing: 1.2em,
    justify: true,
    linebreaks: "optimized",
    first-line-indent: (amount: 1.5em, all: true),
    hanging-indent: 0pt,
  )
  set quote(block: false, quotes: auto)

  set page(
    paper: "a4",
    flipped: false,
    margin: auto,
    binding: auto,
    columns: 1,
    fill: auto,
    numbering: "1",
    supplement: [p.],
    number-align: center + bottom,
    header: book_title,
    background: none,
    foreground: none,
  )
  set text(
    font: "libertinus serif",
    fallback: true,
    style: "normal",
    weight: "regular",
    stretch: 100%,
    size: 12pt,
    fill: luma(0%),
    stroke: none,
    tracking: 0pt,
    spacing: 100%,
    cjk-latin-spacing: auto,
    baseline: 0pt,
    overhang: true,
    top-edge: "cap-height",
    bottom-edge: "descender",
    lang: "fr",
  )

  doc
}

