//central triangles
eTriangle t;
eTriangle s; 

//the wobbly triangles
eTriangle b;
eTriangle b1;
eTriangle b2;

//array of particles
Particle[] star = new Particle[50];

color o = color(250,109,206);

void setup(){
  size(500,500);
  //init particles
  for( int i = 0; i < 50; i++){
    star[i] = new Particle(int(random(width)), int(random(height)));
  }
}

void draw() {
  background(0);
  for( int i = 0; i < 50; i++){
    //"gravitational" force
    PVector p = new PVector(-.5, -.5);
    
    //move toward the center
    if(star[i].location.x < width/2) p.x *= -1;
    if(star[i].location.y < width/2) p.y *= -1;
    
    star[i].mass = i;
    star[i].force(p);
    star[i].update();
    star[i].edges();
    star[i].display();
    
  }
  
  translate(width/2, height/2);
  
  
  //surrounding triangles
  pushMatrix();
  
  //rotates by milliseconds... bobs back and forth w sine function
    rotate(radians(10 * sin(millis() / 300.0 )));
    
    b = new eTriangle(0, 0, -140, 0, o, true);
    b.display();
  popMatrix();
  
  pushMatrix();
    rotate(radians(10 * sin(millis() / 325.0 )));
    
    b1 = new eTriangle(0, 0, -140, 0, color(255,255,92), true);
    b1.display();
  popMatrix();
  
  pushMatrix();
    rotate(radians(10 * sin(millis() / 350.0 )));
    
    b2 = new eTriangle(0, 0, -140, 0, color(118,250,239), true);
    b2.display();
  popMatrix();
  
  
  //central triangles
  color a = #F084F8;
  t = new eTriangle(0, 0, -90, a, 0, false);
  t.display();
  
  s = new eTriangle(0, 0, -65, color(212,106,210, 50), 0, false);
  s.display();
  
  
 
  
  
  
}
