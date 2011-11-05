import processing.opengl.*;

Orbiter bob = new Orbiter();

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
  background(255);
  
  lights();
  
  // make sure the 0, 0 point is in the middle of the screen
  translate(width/2 , height/2);
  
  // map allows us to capture mouse movement in a smaller range
  rotateX( map(mouseY, 0, height, 0, PI/2) );
  
  // draw a single orbiter
  bob.update();
  bob.render();
}

