/*
* @author Omer Farooq Ahmed and Taaha Furqan. This code makes the squares game for ITP by Abdul Wajed
*/

import ddf.minim.*;
AudioPlayer player;
Minim minim;

final int size=20;
boolean play=true;

//initializing all the boxes (the bonuses are represented as circles
Box red= new Box(0, height/2, (int)random(4,6), size);
Box red2=new Box(width/2, 0, (int)random(4,6), size);
Box red3=new Box(width, height*(3/4), (int)random(4,6), size);
Box red4=new Box(width*(3/4), height, (int)random(4,6), size);

Box white= new Box(0, height/2, (int)random(4,6), size);
Box white2=new Box(width/2, 0, (int)random(4,6), size);
Box white3=new Box(width, height*(3/4), (int)random(4,6), size);
Box white4=new Box(width*(3/4), height, (int)random(4,6), size);

Box bonusX= new Box(0, 150, (int)random(6,8), size);
Box bonusY= new Box(250, 0, (int)random(6,8), size);
Box bonus3= new Box(0, 300, (int)random(6,8), size);
Box bonus4= new Box(300, 0, (int)random(6,8), size);

Box pwDown= new Box(0, 200, (int)random(6,8), size);
Box pwDown2=new Box(200, 0, (int)random(6,8), size);
Box pwDown3=new Box(0, 350, (int)random(6,8), size);
Box pwDown4=new Box(350, 0, (int)random(6,8), size);

//PROPERTIES
int score=0;
int timer=0;
boolean slowMo=false;
boolean invinc= false;
int timer2=0;
public int size2=20;
int timer3=0;
int timer4=0;
boolean evil=false;
boolean speed=false;
boolean small=false;
int timer5=0;

void setup() {
  size(600,600);
  background(#FFFFFF); 
  minim= new Minim(this);
  player=minim.loadFile("Primavera.mp3");
  player.play();
  player.loop();
}

void draw() {
  if (play==true) {
    background(255);
    
    fill(#BFB9B9);
    textSize(200);
    text(score, 100,200);
  
    //printing the red boxes
    fill(#F20000);
    red.goX();
    red2.goY();
    red3.goXOpp();
    red4.goYOpp();
  
    //mouse cursor's rect
    fill(0);
    rect(mouseX-size2/2, mouseY-size2/2, size2, size2);

    //printing the white boxes
    fill(255);
    white.goX();
    white2.goY();
    white3.goXOpp();
    white4.goYOpp();  
    
    //printing the bonus ellipses
    fill(255);
    bonusX.bonusXGo();
    bonusY.bonusYGo();
    bonus3.bonusXGo();
    bonus4.bonusYGo();
    
    //printing all power down ellipses
    fill(#F20000);
    pwDown.bonusXGo();
    //pwDown2.bonusYGo();
    pwDown3.bonusXGo();
    pwDown4.bonusYGo();
  }
  
   //checking for game over if al squares evil
  if (red.gameOver() && evil==true || red2.gameOver() && evil==true || red3.gameOver() && evil==true || red4.gameOver() && evil==true || white.gameOver() && evil==true || white2.gameOver() && evil==true || white3.gameOver() && evil==true || white4.gameOver() && evil==true) {
      play=false;
      theEnd();
      println("Your Score is: "+score);
    } 
   //checking to see if game over
  if (red.gameOver() && invinc==false || red2.gameOver() && invinc==false || red3.gameOver() && invinc==false || red4.gameOver() && invinc==false) {
     play=false;
     theEnd();
     println("Your score is: "+score);
  }
  //checking to see if score increments
  if (white.mouseTouch() || white2.mouseTouch() || white3.mouseTouch() || white4.mouseTouch()) {
      score++;
      println(score);
  }
  //checking to see if bonus ellipse touched to trigger slow motion
  if (bonusX.slowMotion()|| slowMo==true) {
    slowMo=true; 
    if (timer<100) {
       timer++; 
       textSize(35);
       fill(#BFB9B9);
       text("Slow Motion", 200, 300);
       frameRate(10);
     }
    else {
      frameRate(60);
      slowMo=false;
      timer=0;
    }
  } 
  //checking to see if bonus ellipse if touched to trigger invincibility
  if (bonusY.mouseTouch() || invinc==true) {
     invinc=true;
     if (timer2<600) {
        timer2++;
        textSize(35); 
        fill(#BFB9B9);
        text("Invincibility", 200,400);
     }
     else {
       invinc=false;
       timer2=0;
     }
  }
  //1000 point bonus
  if (bonus3.mouseTouch()) {
     score+=1000; 
  }
  //small size bonus
  if (bonus4.mouseTouch() || small==true) {
     small=true;
     if (timer5<1000) {
        size2=5;
        timer5++;
     }
     else {
        size2=20;
        timer5=0; 
        small=false;
     }
     
  }
  //power down subtracts 1000 points
  if (pwDown.mouseTouch()) {
     score-=1000; 
  }
  //large size power down 
  //if (pwDown2.mouseTouch()) {
   // size2=50; 
  //}
  
  //power down for speed up 
  if (pwDown3.mouseTouch() || speed==true) {
     speed=true;
     if (timer3<1200) {
        timer3++;
        textSize(35);
        fill(#BFB9B9);
        text("Speed Up", 200,500);
        frameRate(90);
     }
     else {
        speed=false;
        timer3=0;
        frameRate(60); 
     }
  }
  //power down for making all enemies 
  if (pwDown4.mouseTouch() || evil==true) {
     evil=true;
     if (timer4<300) {
        timer4++;
        textSize(35);
        fill(#BFB9B9);
        text("All Squares Are Evil", 200, 450);
     } 
     else {
        evil=false;
        timer4=0; 
     }
  }
  
  
    
  //restarting the game
  if (mousePressed==true) {
     play=true;
     score=0; 
  }
  
}
void theEnd() {
  PImage image= loadImage("gameover.jpg");
  image(image, 0, 0);
  timer=0;
  timer2=0;
  timer3=0;
  timer4=0;
  slowMo=false;
  invinc=false;
  evil=false;
  speed=false;
  size2=20;
  frameRate(60);
  timer5=0;
  small=false;
}
