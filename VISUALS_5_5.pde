//central triangles
eTriangle t;
eTriangle s; 

//the wobbly triangles
eTriangle b;
eTriangle b1;
eTriangle b2;

//array of particles
Particle[] star = new Particle[50];

eTriangle[] squiggles = new eTriangle[10];
float[] xoff1 = new float[10];
float[] yoff1 = new float[10];

color o = color(250,109,206);
color a = #F084F8;

float xoff = 0.0;
float yoff = 0.0;

float xoff2 = 0.0;
float yoff2 = 0.0;

float xoff3 = 0.0;
float yoff3 = 0.0;




void setup(){
  size(700,700);
  //init particles
  int incr = 100;
  
  for( int i = 0; i < 50; i++){
    star[i] = new Particle(int(random(width)), int(random(height)));
  }
  
  //an array of squiggly triangles
  for (int i = 0; i < squiggles.length; i++){
    incr *= 1.1;
    squiggles[i] = new eTriangle(0,0, (-250 - (i * incr)),0, o,true);
  }
  
  //array of noise offsets for the squiggly triangles
  for (int i = 0; i < squiggles.length; i++){
    xoff1[i] = random(0,1);
    yoff1[i] = random(0,1);
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
    
  
    xoff += 0.05;
    yoff += 0.01;
    
    xoff2 += random(0,.1);
    yoff2 += random(0,.1);
    
    xoff3 += random(0,.1);
    yoff3 += random(0,.1);
    
    b = new eTriangle(0, 0, -140, 0, o, true);
    b.squiggleTriangle(30, xoff2, yoff2, color(255,255,92), 2);
    
    b1 = new eTriangle(0, 0, -140, 0, o, true);
    b1.squiggleTriangle(30, xoff, yoff, color(118,250,239), 2);
    
    b2 = new eTriangle(0, 0, -140, 0, o, true);
    b2.squiggleTriangle(30, xoff3, yoff3, color(255), 2);
    

    
    
  
  
  
  /*
 pushMatrix();
   rotate(radians(millis() / 300.0 ));  
  //array of squigglos
   for(int i = 0; i < squiggles.length; i++){
    // color f = lerpColor(color(255), color(255,255,92), random(0,1));
   // color h = lerpColor(f, g, random(0,1));
   
     color g = lerpColor(a, color(118,250,239), noise(xoff1[i],yoff1[i]));
     xoff1[i] += .005;

     squiggles[i].squiggleTriangle(30, xoff1[i], yoff1[i],g, 10);

     yoff1[i] += .005;
   }
  popMatrix();
  
  */
  
  //central triangles
  t = new eTriangle(0, 0, -90, a, 0, false);
  t.display();
  
  s = new eTriangle(0, 0, -65, color(212,106,210, 50), 0, false);
  s.display();
  
  
 
  
  
  
}
