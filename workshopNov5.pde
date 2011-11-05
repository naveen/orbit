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

void draw() {
  background(255);
  
  // make sure the 0, 0 point is in the middle of the screen
  translate(width/2 , height/2);
  
  // draw a single orbiter
  bob.update();
  bob.render();
}

