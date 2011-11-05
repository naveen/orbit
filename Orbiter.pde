class Orbiter {
  
  float radius = 100.0;
  float theta = 0;
  float thetaSpeed = 0.1;
  
  // let's set a custom x, y for this orbiter
  PVector pos = new PVector();
  
  Orbiter() {
    
  }
  
  void update() {
    theta += thetaSpeed;
  }
  
  void render() {
    pushMatrix();
    
      translate(pos.x, pos.y);
    
      rotate(theta);
      line(0, 0, radius, 0);
      
      // two ways to do this, one standard, one with translate
      // ellipse(radius, 0, 5, 5);
      translate(radius, 0);
      ellipse(0, 0, 5, 5);
      
      // if we weren't using pushMatrix and popMatrix, then we'd have to layer back out:
      // translate(-radius, 0);
      // rotate(-theta);
    
    popMatrix();
  }
  
}
