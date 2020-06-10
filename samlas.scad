// real life cm - 28cm irl, 28 here
// render smaller things, and match scale of unit.scad
samla_5 =   [[28, 20, 14], "5L"];
samla_11 =  [[39, 29, 18], "11L"];
samla_22 =  [[39, 28, 28], "22L"];
samla_65 =  [[56, 39, 42], "65L"];
samla_130 = [[78, 56, 43], "130L"];

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

module labelled_samla(type) {
  difference() {
    samla(type);
    label_top(type) label(type);
  }
}

module test_samlas() {
  labelled_samla(samla_5);

  translate([50, 0, 0]) {
    labelled_samla(samla_11);
  }

  translate([100, 0, 0]) {
    labelled_samla(samla_22);
  }

  translate([0, 70, 0]) {
    labelled_samla(samla_65);
  }

  translate([70, 70, 0]) {
    labelled_samla(samla_130);
  }
}

//test_samlas();
