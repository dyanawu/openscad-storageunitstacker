use <samlas.scad>
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

labelled_samla(11);

placegrid (
  vol = storageunit,
  origin = [0,0],
  grid = grid,
  vertalign = 1
);
