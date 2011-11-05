class Orbiter {
  
  float radius = 100.0;
  float theta = 0;
  float thetaSpeed = 0.1;
  
  // let's set a custom x, y for this orbiter
  PVector pos = new PVector();

  // array of set number of items  
  // Orbiter[] children = new Orbiter[3];
  
  // instead, dynamic array
  ArrayList<Orbiter> children = new ArrayList();
  
  Orbiter() {
    
  }
  
  void spawn() {
    // how many children to spawn
    int childCount = ceil(random(3)); // we want either 1, 2 or 3
    
    // create children
    for (int i = 0; i < childCount; i++) {
      Orbiter child = new Orbiter();
      child.radius = random(50, 200);
      child.thetaSpeed = random(-0.1, 0.1); // theta will be positive/negative (forward/backwards)
      children.add(child);
    }
  }
  
  void update() {
    theta += thetaSpeed;
  }
  
  void render() {
    pushMatrix();
    
      translate(pos.x, pos.y);
    
      rotate(theta);
      stroke(0, 50);
      line(0, 0, radius, 0);
      
      // two ways to do this, one standard, one with translate
      // ellipse(radius, 0, 5, 5);
      translate(radius, 0);
      
      // update and render children
      for (Orbiter child:children) {
        child.update();
        child.render();
      }
      
      ellipse(0, 0, 5, 5);
      
      // if we weren't using pushMatrix and popMatrix, then we'd have to layer back out:
      // translate(-radius, 0);
      // rotate(-theta);
    
    popMatrix();
  }
  
}
