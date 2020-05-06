class eTriangle{
  float dx, dy, ex, ey, fx, fy;
  color c1;
  int s1;
  boolean strok;
  
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
  
  
  
  
}
