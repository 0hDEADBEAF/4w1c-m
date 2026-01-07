#import "@preview/cetz:0.4.2": canvas, draw, tree

#import "colors.typ": COLORS

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

#let elements() = {
  canvas(length: 2cm, {
    import draw: *

    content((0, 0), (2, 2), box(
      par(
        justify: false,
      )[$E$\
        $0$ ->],
      stroke: 1pt,
      width: 100%,
      height: 100%,
      inset: 1em,
    ))
  })
}

