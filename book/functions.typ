#import "@preview/cetz:0.4.2": canvas, draw, tree

#import "colors.typ": COLORS
#import "symbols.typ": SYMBOLS

#let coord(x, y) = {
  (x: x, y: y)
}

#let grid(w, h, colors: (), with_axis: true) = {
  canvas(length: 0.5cm, {
    import draw: *

    grid(
      (0, 0),
      (w, h),
    )
    for (color, positions) in colors.pairs() {
      for pos in positions {
        let x = calc.rem-euclid(pos.at(0), w)
        let y = calc.rem-euclid(pos.at(1), h)
        rect((x, y), (x + 1, y + 1), fill: COLORS.at(color))
      }
    }
  })
}

#let elements(symbols) = {
  let string_content = ""
  for (i, symbol_name) in symbols.enumerate() {
    let symbol = SYMBOLS.at(symbol_name)
    string_content += $#i arrow symbol$ + "\n"
  }
  set par(first-line-indent: (amount: 0em, all: true))

  context {
    let height = measure([string_content]).height

    canvas(length: height + 0.3cm, {
      import draw: *
      content((0, 0), (4, symbols.len() + 1), box(
        par(
          justify: false,
          leading: 0.3cm,
        )[$E :$\ #string_content],
        stroke: 1pt,
        width: 100%,
        height: 100%,
        inset: 1em,
      ))
    })
  }
}

