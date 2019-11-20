//your variable declarations here
Spaceship uwu;
Star[] shiny;
ArrayList <Asteroid> owo = new ArrayList <Asteroid>();
ArrayList <Bullet> pewpew = new ArrayList <Bullet>();
boolean a, w, s, d, shift, e = false;
public void setup() 
{
  size(600, 600);
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
  for (int i=0; i<shiny.length; i++) {
  	shiny[i].show();
  }
  uwu.move();
  uwu.show();
  for (int i=0; i<owo.size(); i++) {
  	owo.get(i).show();
  	owo.get(i).move();
  }
  for (int i=0; i<pewpew.size(); i++) {
  	pewpew.get(i).show();
  	pewpew.get(i).move();
  }
  if (!keyPressed) {
  	uwu.setDirectionX(0);
  	uwu.setDirectionY(0);
  }
}
public void keyPressed() {
  if (key == 'a') {
  	a = true;
  } else {
  	a = false;
  }
  if (key == 'd') {
  	d = true;
  } else {
  	d = false;
  }
  if (key == 'w') {
  	w = true;
  } else {
  	w = false;
  }
  if (key == 's') {
  	s = true;
  } else {
  	s = false;
  }
  if (key == 'e') {
  	e = true;
  } else {
  	e = false;
  }
  if (key == CODED) {
  	if (keyCode == SHIFT) {
  		shift = true;
  	} else {
  		shift = false;
  	}
  } else {
  	shift = false;
  }
  if (a) {
  	uwu.turn(-10);
  }
  if (d) {
  	uwu.turn(10);
  }
  if (w) {
  	uwu.accelerate(0.075);
  }
  if (s) {
  	uwu.accelerate(-1*0.075);
  }
  if (shift) {
  	uwu.hyperspace();
  }
  if (e) {
  	pewpew.add(new Bullet(uwu));
  }
}


