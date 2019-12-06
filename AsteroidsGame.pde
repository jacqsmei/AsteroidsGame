//your variable declarations here
Spaceship uwu;
Star[] shiny;
ArrayList <Asteroid> owo = new ArrayList <Asteroid>();
ArrayList <Bullet> pewpew = new ArrayList <Bullet>();
boolean a, w, s, d, e = false;

public void setup() 
{
  size(600, 600);
  textAlign(CENTER);
  background(0);
  uwu = new Spaceship();
  shiny = new Star[100];
  for (int i=0; i<shiny.length; i++) {
  	shiny[i] = new Star();
  }
  for (int i=0; i<10; i++) {
  	owo.add(new Asteroid());
  }
}

public void draw() 
{
  background(0);

  shiny();
  owo();
  uwu();
  pewpew();

  if (!keyPressed) {
    stopAccel();
  }

  bulletAst();
  bulletScr();
  shipAst();
}

public void keyPressed() {
  if (key == 'a') {
    uwu.turn(-10);
  }
  if (key == 'd') {
    uwu.turn(10);
  }
  if (key == 'w') {
    uwu.accelerate(0.075);
  }
  if (key == 's') {
    uwu.accelerate(-1*0.075);
  }
  if (key == CODED && keyCode == SHIFT) {
    uwu.hyperspace();
  }
}

public void mousePressed() {pewpew.add(new Bullet(uwu));}

public void shiny() {
  for (int i=0; i<shiny.length; i++) {shiny[i].show();}
}

public void uwu() {
  uwu.move();
  uwu.show();
}

public void owo() {
  for (int i=0; i<owo.size(); i++) {
    owo.get(i).show();
    owo.get(i).move();
  }
}

public void pewpew() {
  for (int i=0; i<pewpew.size(); i++) {
    pewpew.get(i).show();
    pewpew.get(i).move();
  } 
}

public void stopAccel() {
    uwu.setDirectionX(0);
    uwu.setDirectionY(0);  
}

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

public void shipAst() {
  if (owo.size()>0) {
    for (int i=owo.size()-1; i>=0; i--) {
      if (dist((float)owo.get(i).getCenterX(), (float)owo.get(i).getCenterY(), (float)uwu.getCenterX(), (float)uwu.getCenterY())<=15) {
        noLoop();
        background(0);
        fill(255, 0, 0);
        text("you died", 300, 300);
      }
    }
  }
}