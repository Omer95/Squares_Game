
class Box {
  //PROPERTIES
  int x, y; //position
  int dX; //speed
  int a; //size
  
  
  public Box (int x, int y, int dX, int a) {
     this.x=x;
     this.y=y;
     this.dX=dX;
     this.a=a; 
  }
  
  public void goX() { //moving box forward horizontally 
   x+=dX;
   if (x>width) {
      x=-5;
      y=(int)random(1, height); 
   }
   rect(x,y,a,a);
  }
  public void goY() { //moving box downwards vertically
   y+=dX;
   if (y>height) {
      y=-5;
      x=(int)random(1, width);
   } 
   rect(x,y,a,a);
  }
  public void goXOpp() { //moving box backward horizotally 
    x-=dX;
    if (x<0) {
       x=width+5;
       y=(int)random(1, height); 
    }
    rect(x,y,a,a);
  }
  public void goYOpp() { //moving box upwards vertically 
    y-=dX;
    if (y<0) {
       y=height+5;
       x=(int)random(1, width);
    } 
    rect(x,y,a,a);
  }
  
  public void bonusXGo() { //moving the bonus circle horizontally
    x+=dX;
    if (x>width) {
       x=-200;
       y=(int)random(1, height); 
    }
    ellipse(x,y,a,a);
  }
  public void bonusYGo() {
    y+=dX;
    if (y>height) {
       y=-200;
       x=(int)random(1, width);
    } 
    ellipse(x,y,a,a);
  }
  
  
  public boolean gameOver() { //checking to see if the mouse cursor has touched red boxes
    if (mouseX>=x && mouseX<=x+a && mouseY>=y && mouseY<=y+a)
       return true;
    else 
       return false;
  }
  
  public boolean mouseTouch() { // this method will be used when white boxes are touched
    if (mouseX>=x && mouseX<=x+a && mouseY>=y && mouseY<=y+a) {
       x=width+50;
       y=(int)random(1, height);
       return true;
    }
    else 
      return false; 
  }
  
  public boolean slowMotion() { //this method is invoked to see if slowmotion ellipse is touched
    if (mouseX>=x && mouseX<=x+a && mouseY>=y && mouseY<=y+a) {
       x=width+50;
       y=(int)random(1,height);
       return true; 
    }
    else 
      return false;
  }
  public boolean large() {
    if (mouseX>=x && mouseX<=x && mouseY>=y && mouseY<=y+a) {
       x=width+50;
       y=(int)random(1,height);
       return true; 
    }
    else 
      return false;
  }
  
}
