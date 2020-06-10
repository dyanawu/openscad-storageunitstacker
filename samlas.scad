include <MCAD/units/metric.scad>

// real life cm - 28cm irl, 28 here
// render smaller things, and match scale of unit.scad
samla_5 = [28, 20, 14];
samla_11 = [39, 29, 18];
samla_22 = [39, 28, 28];
samla_130 = [78, 56, 43];

module samla (size) {
  translate([-size[0] - 10, 0, 0]) cube(size);
}
