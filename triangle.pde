class eTriangle{
  float dx, dy, ex, ey, fx, fy;
  color c1;
  int s1;
  boolean strok;
  float yoff = 0.0;
  
  //default constructor w expected values
  eTriangle(float cx, float cy, float h, color a, int stroke, boolean sf){
    dx = cx;
    dy = cy + h;
    ex = dx * cos(radians(120)) - (dy * sin(radians(120)));
    ey = dx * sin(radians(120)) + (dy * cos(radians(120)));
    fx = dx * cos(radians(240)) - (dy * sin(radians(240)));
    fy = dx * sin(radians(240)) + (dy * cos(radians(240)));
    
    c1 = a;
    s1 = stroke;
    strok = sf;
  }
  
  void display() {
    fill(c1);
    strokeWeight(2);
    stroke(s1);
    
    if(!strok) noStroke();
    if(c1 == 0) noFill();
    
    triangle(dx, dy, ex, ey, fx, fy);
  }
  
  void squiggleTriangle(int points, float xoff, float yoff, color str, int strW) {
    stroke(str);
    strokeWeight(strW);
    noFill();
   
   pushMatrix();
    scale(mS); 
      
    
    beginShape();

    
      //face 1. The vertices are generated and then 
      for(float i = 0; i < points; i++){
        //noise
        float offset = map(noise(xoff, yoff), 0, 1, -20, 20);
        
        float x = lerp(dx, ex, i/points) + offset;
        float y = lerp(dy, ey, i/points);
        vertex(x, y);
        
        xoff += .05;
      }
      
      //face 2
      for(float i = 0; i < points; i++){
        float offset = map(noise(xoff, yoff), 0, 1, -20, 20);
        
        float x = lerp(ex, fx, i/points) + offset;
        float y = lerp(ey, fy, i/points) + offset;
        vertex(x, y);
        
        xoff += .05;
      }
      
      //face 3
      for(float i = 0; i < points; i++){
        float offset = map(noise(xoff, yoff), 0, 1, -20, 20);
        
        float x = lerp(fx, dx, i/points) + offset;
        float y = lerp(fy, dy, i/points) + offset;
        
        vertex(x, y);
        xoff += .05;
      }

    endShape(CLOSE);
     
     popMatrix();

  }
  
  
  
  
}
