// Example file, showing how all parameters can be set

// These dimensions have been successfully tested
module setParameters() {
    $r = 21.8;
    $basketRimR = 2.4;
    $funnelHeight = 20;
    $insideHeight = 4.5;
    $funnelR = 13;
    $wallThickness = 1.4;
    $extraHeight = 1.2;
    $eps = 0.01; // Any small number.
}

module removeFromRim() {
    square($basketRimR, $basketRimR);
}

include <coffeefunnel.scad>;