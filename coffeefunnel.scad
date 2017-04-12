$fn=128;

outerR = r + 2*basketRimR;
funnelHeight = 20;
insideHeight = 4.5;
funnelR = 13;
wallThickness = 1.4;
eps = 0.01;
extraHeight = 1.2;

difference(){
    union(){
        // Create funnel structure, leaving room for the rim section
        translate([0,0,-extraHeight])
        difference () {
            cylinder(funnelHeight + extraHeight, outerR + wallThickness, outerR + funnelR + wallThickness);
            translate([0,0,insideHeight + extraHeight]) cylinder(funnelHeight + extraHeight - insideHeight + eps, r, outerR + funnelR);
            translate([0,0,-eps]) cylinder(basketRimR + extraHeight +eps, outerR, outerR);
        }
        
        // Add rim section
        rotate_extrude(convexity = 10, $fn = 100)
        translate([r+basketRimR, 0, 0])
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
            translate([-100,-200,0])
            square(200,200);
        }
    }
    
    // Cut out anything extra on the inside, along with some margin
    translate([0,0,-eps])
    union(){
        //translate([0,0,-25]) cube([50,50,50]);
        //cylinder(basketRimR, r+basketRimR,r+basketRimR);
        cylinder(funnelHeight+extraHeight+eps,r+0.05-2*eps,r+0.05-2*eps);
    }
}