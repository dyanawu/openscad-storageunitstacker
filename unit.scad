include <MCAD/units/metric.scad>


// units in real life cm: e.g. 1.5m in real life -> 150 here
// lets us render smaller things lol
linear_extrude(height = 2) text("extraspace XS", size = 5, $fn=100);
length = 147;
width = 132;
height = 137;
storageunit = [length,width,height];
grid = [length/4, width/4, height/4];

module placegrid ( vol = [150,120,100], //3-vector of build volume in mm
                   origin = [0,0],      //coordinates of origin
                   grid = [10,10,10], //grid spacing in mm for each axis
                   vertalign = 0        //0 = vertical grids aligned to [0,0], 1 = [x max, y max]
) {
  translate (-origin) {
    buildbox (vol, grid, vertalign);
  }
}

module buildbox (vol, grid, vertalign) {
  plane (X, Y, vol, [grid[0], grid[1]]);
  translate ([vertalign*vol[0],0,0]) {
    plane (Y, Z, vol, [grid[1], grid[2]]);
  }
  translate ([0,vertalign*vol[1],0]) {
    plane (X, Z, vol, [grid[0], grid[2]]);
  }
}

module plane (ax1, ax2, vol,grid) {
  array (ax1, vol, grid[0]) line(vol, ax2);
  array (ax2, vol, grid[1]) line(vol, ax1);
}

module line (vol, axis) {
  cube ([
           (axis[0] ? axis[0]*vol[0] : 0.5),
           (axis[1] ? axis[1]*vol[1] : 0.5),
           (axis[2] ? axis[2]*vol[2] : 0.5)]);
}

module array (axis, vol, grid) {
  for (i = [0:floor(axis*vol/grid)]) {
    translate ((i*grid)*axis)
      children ();
  }
}

// example block

placegrid (
  vol = storageunit,
  origin = [0,0],
  grid = grid,
  vertalign = 1
);
