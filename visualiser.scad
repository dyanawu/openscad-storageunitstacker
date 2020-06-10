include <samlas.scad>
include <unit.scad>

// sizes at 1:10
// basically, use real life cm without units here
// like: 1.5m irl -> 150 here
//       28cm irl -> 28 here

length = 147;
width = 132;
height = 137;
storageunit = [length,width,height];
grid = [length/4, width/4, height/4];

samla(samla_5);
translate([0, 40, 0]) samla(samla_11);

label("extraspace XS");

placegrid (
  vol = storageunit,
  origin = [0,0],
  grid = grid,
  vertalign = 1
);
