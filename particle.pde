class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Particle() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  Particle(int lx, int ly) {
    location = new PVector(lx,ly);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void force(int x, int y){
    //want this to be a vector we can give to the particles!
  // acceleration = new PVector(x, y);
    
    //for now is random
    acceleration = acceleration.random2D();
  }
  
  //acceleration changes velocity. 
  void update() {
    
    velocity.add(acceleration);
    location.add(velocity);
    
    //PVector limits function down to specified value
    velocity.limit(10);
  }
  
  
  //this is jank
  void edges() {
    if (location.x > width)   location.x = width;
    if (location.x < 0)         location.x = 0;
    if (location.y > height)  location.y = height;
    if (location.y < 0)         location.y = 0;
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, 5, 5);
    
  }
  
}
