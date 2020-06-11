use <dict.scad>

// real life cm - 28cm irl, 28 here
// render smaller things, and match scale of unit.scad
samlas = [
  [5,   [[28, 20, 14], "5L"]],
  [11,  [[39, 29, 18], "11L"]],
  [22,  [[39, 28, 28], "22L"]],
  [65,  [[56, 39, 42], "65L"]],
  [130, [[78, 56, 43], "130L"]]
];

module samla (type) {
  cube(type[0]);
}

module label(type) {
  #linear_extrude(height = 2) text(type[1], size=type[0][1]/3);
}

module label_top(type) {
  translate([3, 3, type[0][2] - 1])
    children();
}

module labelled_samla(size) {
  type = dict_get(samlas, size);
  echo(type);
  difference() {
    samla(type);
    label_top(type) label(type);
  }
}
