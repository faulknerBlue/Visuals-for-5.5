class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  Particle() {
    location = new PVector(250,250);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    
  }
  
  Particle(int lx, int ly) {
    location = new PVector(lx,ly);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 1.0;
  }
  
  void force(PVector force){
    //want this to be a vector we can give to the particles!
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
    

  }
  
  //acceleration changes velocity. 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);


    //PVector limits function down to specified value
    velocity.limit(10);
  }
  
  
  //this is jank
  void edges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } 
    else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
    else if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
    
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, 4, 4);
    
  }
  
}
