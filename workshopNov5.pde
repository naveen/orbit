Orbiter bob = new Orbiter();

void setup() {
  size(700,700);
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

