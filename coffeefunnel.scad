$fn=128;

outerR = r + 2*basketRimR;
funnelHeight = 20;
insideHeight = 4.5;
funnelR = 13;
wallThickness = 1.8;
eps = 0.01;

difference(){
union(){
    cylinderWall(funnelHeight, outerR, outerR + funnelR);
    translate([0,0,insideHeight]) cylinderWall(funnelHeight - insideHeight, r, outerR + funnelR);
    

rotate_extrude(convexity = 10, $fn = 100)
translate([r+basketRimR, 0, 0])
difference(){
difference(){
union(){
    basketRimOuterR = basketRimR + wallThickness;

    polygon(points=[[-basketRimR, 0],[-basketRimR, insideHeight],[-basketRimR + wallThickness, insideHeight],[-basketRimR + wallThickness, 0]]);
    circle(r = basketRimOuterR, $fn = 100);
}
union(){
    circle(r = basketRimR, $fn = 100);
    removeFromRim();
}
}
translate([-100,-200,0])
square(200,200);
}
}

translate([0,0,-eps])
union(){
    //cube([50,50,50]);
    //cylinder(basketRimR, r+basketRimR,r+basketRimR);
    cylinder(funnelHeight+eps,r-2*eps,r-2*eps);
}
}

module cylinderWall(h,r1,r2){
  difference(){
	  cylinder(h,r1+wallThickness,r2+wallThickness);
	  translate([0,0,-eps])
        cylinder(h+2*eps,r1,r2);
  }
}

