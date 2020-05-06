//central triangles
eTriangle t;
eTriangle s; 

//the wobbly triangles
eTriangle b;
eTriangle b1;
eTriangle b2;

//array of particles
Particle[] star = new Particle[30];

color o = color(250,109,206);

void setup(){
  size(500,500);
  //init particles
  for( int i = 0; i < 30; i++){
    star[i] = new Particle(i, i);
  }
}

void draw() {
  background(0);
  for( int i = 0; i < 30; i++){
    star[i].force(0,1);
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
    
    b1 = new eTriangle(0, 0, -145, 0, color(255,255,92), true);
    b1.display();
  popMatrix();
  
  pushMatrix();
    rotate(radians(10 * sin(millis() / 350.0 )));
    
    b2 = new eTriangle(0, 0, -150, 0, color(118,250,239), true);
    b2.display();
  popMatrix();
  
  
  //central triangles
  color a = #F084F8;
  t = new eTriangle(0, 0, -100, a, 0, false);
  t.display();
  
  s = new eTriangle(0, 0, -70, color(212,106,210, 50), 0, false);
  s.display();
  
  
 
  
  
  
}
