import processing.opengl.*;

Orbiter bob = new Orbiter();

float depth = 1;
float tdepth = 1;

void setup() {
  // add 3d renderer, import->opengl
  size(700,700,OPENGL);
  
  background(255);
  smooth();
  
  bob.thetaSpeed = 0.01;
  bob.spawn();
}

// rotate z (pinwheel); x (foosball); y (ballerina)
void draw() {
  // move the depth towards the target depth
  depth += (tdepth - depth) * 0.1;
  
  background(255);
  
  lights();
  
  // make sure the 0, 0 point is in the middle of the screen
  translate(width/2 , height/2);
  
  rotateX( 1.4 );

  // change tallness of map
  tdepth = map(mouseY, 0, height, 1, 0);
  
  // draw a single orbiter
  bob.update();
  bob.render();
}

