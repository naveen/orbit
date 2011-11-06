import processing.video.*;
import processing.opengl.*;

Orbiter bob = new Orbiter();

float depth = 1;
float tdepth = 1;

float rot = 1;
float trot = 1;

float flatness = 0;
float tflatness = 0;

MovieMaker mm;
boolean recording = false;

void setup() {
  // add 3d renderer, import->opengl
  size(1280,720,OPENGL);
  
  background(255);
  smooth();
  
  bob.thetaSpeed = 0.01;
  bob.spawn();
}

// rotate z (pinwheel); x (foosball); y (ballerina)
void draw() {
  // easing function: move the depth towards the target depth
  // (every frame...i move a tenth of the way to my target)
  depth += (tdepth - depth) * 0.1;
  
  // easing function: rotate weight
  rot += (trot - rot) * 0.1;
  
  // easing function: flatness across an axis
  flatness += (tflatness - flatness) * 0.1;
  
  background(255);
  
  lights();
  
  // make sure the 0, 0 point is in the middle of the screen
  translate(width/2 , height/2 + 200);
  
  scale(1.5);
  rotateX( 1.4 );

  // change tallness of map interactively
//  tdepth = map(mouseY, 0, height, 1, 0);
  
  // draw a single orbiter
  bob.update();
  bob.render();
  
  if (recording) mm.addFrame();
}

void keyPressed() {
  // toggle depth
  if (key == 'd') tdepth = (tdepth == 0) ? (1):(0);
  
  // toggle rotate weight (trot = toggle; rot in here = hold for slowness)
  if (key == 'r') trot = (trot == 0) ? 1:0;
  
  if (key == 'f') tflatness = (tflatness == 0) ? 1:0;
  
  if (key == 's') saveImage();
  if (key == 'm') {
    if (recording) {
      recording = false;
      mm.finish();
      println("movie record finished");
    } else {
      recording = true;
      mm = new MovieMaker(this, width, height, "drawing.mov", 30, MovieMaker.JPEG, MovieMaker.HIGH);
      println("movie record started");
    }
  }
}

void saveImage() {
  String timestamp = hour() + "_" + minute() + "_" + second();
  save("out/" + timestamp + ".png");
}

