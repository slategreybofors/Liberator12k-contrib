use <../Meta/Debug.scad>;
use <../Meta/Resolution.scad>;
use <../Meta/Manifold.scad>;

use <../Vitamins/Pipe.scad>;
use <../Vitamins/Rod.scad>;

function DoubleShaftCollarOD()     = 1.875;
function DoubleShaftCollarHeight() = 0.51;

module DoubleShaftCollar2d(od=DoubleShaftCollarOD()+0.02,
                           boltWidth=1.857+0.04, boltLength=0.34, boltOffset=0.22) {
  outsideRadius = od/2;

  union() {

    // Shaft Collar
    circle(r=outsideRadius, $fn=Resolution(12,40));

    // Side cutout
    for (m=[0,1])
    mirror([0,m])
    translate([boltOffset,-boltWidth/2])
    square([boltLength,boltWidth]);
  }
}

module DoubleShaftCollar(od=1.875+0.02, height=DoubleShaftCollarHeight(), extend=0) {
  outsideRadius = od/2;

  render() {
    linear_extrude(height=height)
    DoubleShaftCollar2d();

    // Access extension
    if (extend>0)
    translate([0,-outsideRadius+(0.125*sqrt(2)), 0.25])
    rotate([45,0,0])
    translate([0,-0.125,-0.125])
    cube([extend, 0.25, 0.25]);
  }
}

scale(25.4) rotate([0,90,0])
render()
difference() {
  scale(1.1)
  DoubleShaftCollar();

  translate([-ManifoldGap(),0,0])
  DoubleShaftCollar(extend=0);
}