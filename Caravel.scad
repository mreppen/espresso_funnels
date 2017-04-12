// These dimensions have been successfully tested
module setParameters() {
    $r = 21.8;
    $basketRimR = 2.4;
}

module removeFromRim() {
    square($basketRimR, $basketRimR);
}

include <coffeefunnel.scad>;