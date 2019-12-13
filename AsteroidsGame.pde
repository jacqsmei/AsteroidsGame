import java.util.*;
//variable declarations
Spaceship uwu;
Spaceship ufo;
Star[] shiny;
ArrayList <Asteroid> owo = new ArrayList <Asteroid>();
ArrayList <Bullet> pewpew = new ArrayList <Bullet>();
ArrayList <Bullet> ohnos = new ArrayList <Bullet>();
Timer timer;
int delay = 30000;
//booleans to check if keys are pressed
boolean a, w, s, d, shift = false;
//game screen mode
int mode = 0;
/*
modes:
0 = start
1 = game
2 = win
3 = lose
*/

public void setup() 
{
  size(600, 600);
  textAlign(CENTER);
  background(0);
  uwu = new Spaceship(255, 255, 255);
  ufo = new Spaceship(255, 0, 0);
  shiny = new Star[100];
  for (int i=0; i<shiny.length; i++) {
  	shiny[i] = new Star();
  }
  for (int i=0; i<10; i++) {
  	owo.add(new Asteroid());
  }
  timer = new Timer();
}

public void draw() 
{
  if (mode == 0) {
    restart();
    startingScr();
    if (keyPressed && key == 'e') {
      mode = 1;
    }
  }
  if (mode == 1) {
    background(0);
    star();
    ship();
    ast();
    bullet();
    checkKeys();
    bulletAst();
    bulletScr();
    noAst();
    shipAst();
    checkF();
  }
  if (mode == 2) {
    win();
    restart();
    checkF();
  }
  if (mode == 3) {
    lose();
    restart();
    checkF();
  }
}

//draw starting screen
public void startingScr() {
  background(0);
  fill(255);
  textSize(14);
  text("asteroids.", 300, 300);
  textSize(10);
  text("press e to start", 300, 350);
  text("press f at anytime to pause", 300, 400);
}

//check key pressing and set booleans to true
public void keyPressed() {
  if (key == 'a') {
    a = true;
  }
  if (key == 'w') {
    w = true;
  }
  if (key == 's') {
    s = true;
  }
  if (key == 'd') {
    d = true;
  }
  if (key == CODED && keyCode == SHIFT) {
    shift = true;
  }
}

//check key release and set booleans to false
public void keyReleased() {
  if (key == 'a') {
    a = false;
  }
  if (key == 'w') {
    w = false;
  }
  if (key == 's') {
    s = false;
  }
  if (key == 'd') {
    d = false;
  }
  if (key == CODED && keyCode == SHIFT) {
    shift = false;
  }
}

//check booleans and turn, accel, etc
public void checkKeys() {
  if (a) {
    uwu.turn(-2);
  }
  if (w) {
    uwu.accelerate(0.075);
  }
  if (s) {
    uwu.accelerate(-0.075);
  }
  if (d) {
    uwu.turn(2);
  }
  if (shift) {
    uwu.hyperspace();
  }
  if (!w && !s) {
    stopAccel();
  }
}

public void checkF() {
  if (keyPressed && key == 'f') {
    mode = 0;
  }
}

//check if mouse is pressed and shoot
public void mousePressed() {pewpew.add(new Bullet(uwu));}

//initializing
public void star() {
  for (int i=0; i<shiny.length; i++) {shiny[i].show();}
}

public void ship() {
  uwu.move();
  uwu.show();
}

public void ast() {
  for (int i=0; i<owo.size(); i++) {
    owo.get(i).show();
    owo.get(i).move();
  }
}

public void bullet() {
  for (int i=0; i<pewpew.size(); i++) {
    pewpew.get(i).show();
    pewpew.get(i).move();
  } 
}

// 01.
// int delay = 5000; //msecs
// 02.
// Timer timer = new Timer();
// 03.
// timer.schedule(new TimerTask()
// 04.
// {
// 05.
// public void run()
// 06.
// {
// 07.
// // put the code you want to run here
// 08.
// // It will get executed in 5000 msecs
// 09.
// }
// 10.
// }, delay);

public void ufoLaunch() {
  timer.schedule(new TimerTask() {
    public void run() {
      loop();
      ufo.show();
      ufo.move();
      ufo.setDirectionX(uwu.getDirectionX());
      ufo.setDirectionY(uwu.getDirectionY());
    }
  },
  delay
  );
}

//stop acceleration
public void stopAccel() {
    uwu.setDirectionX(0);
    uwu.setDirectionY(0);  
}

//check bullet asteroid collision
public void bulletAst() {
  if (pewpew.size()>0 && owo.size()>0) {
    for (int i=pewpew.size()-1; i>=0; i--) {
      for (int j=owo.size()-1; j>=0; j--) {
        if (dist((float)pewpew.get(i).getCenterX(), (float)pewpew.get(i).getCenterY(), (float)owo.get(j).getCenterX(), (float)owo.get(j).getCenterY())<15) {
          pewpew.remove(i);
          owo.remove(j);
          break;
        }
      }
    }
  }
}

//check bullets that go off screen
public void bulletScr() {
  if (pewpew.size()>0) {
    for (int i=pewpew.size()-1; i>=0; i--) {
      if (pewpew.get(i).getCenterX()>=600 || pewpew.get(i).getCenterX()<=5) {
          pewpew.remove(i);
          break;
      }
      if (pewpew.get(i).getCenterY()>=600 || pewpew.get(i).getCenterY()<=0) {
          pewpew.remove(i);
          break;
      }
    }
  }
}

//check if no asteroids left, game win
public void noAst() {
  if (owo.size()==0) {
    mode = 2;
  }
}

// draw win screen
public void win() {
  background(0);
  fill(255, 255, 0);
  textSize(12);
  text("you won!", 300, 300);
  text("press r to restart", 300, 350);
}

//check ship asteroid collision, game lose
public void shipAst() {
  if (owo.size()>0) {
    for (int i=owo.size()-1; i>=0; i--) {
      if (dist((float)owo.get(i).getCenterX(), (float)owo.get(i).getCenterY(), (float)uwu.getCenterX(), (float)uwu.getCenterY())<=15) {
        mode = 3;
      }
    }
  }
}

//draw lose screen
public void lose() {
  background(0);
  fill(255, 0, 0);
  textSize(12);
  text("you died", 300, 300);
  text("press r to restart", 300, 350);
}

//resetting game for restart
public void removeAll() {
  for (int i=owo.size()-1; i>=0; i--) {
    owo.remove(i);
  }
  for (int i=pewpew.size()-1; i>=0; i--) {
    pewpew.remove(i);
  }
  shiny = null;
}

//restart game
public void restart() {
  if (keyPressed && key == 'r') {
    mode = 1;
    removeAll();
    background(0);
    setup();
  }
}