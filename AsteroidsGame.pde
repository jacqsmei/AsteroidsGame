//your variable declarations here
Spaceship uwu;
Star[] shiny;
boolean a, w, s, d, shift = false;
public void setup() 
{
  size(600, 600);
  background(0);
  uwu = new Spaceship();
  shiny = new Star[100];
  for (int i=0; i<shiny.length; i++) {
  	shiny[i] = new Star();
  }
}
public void draw() 
{
  background(0);
  for (int i=0; i<shiny.length; i++) {
  	shiny[i].show();
  }
  uwu.show();
  uwu.move();
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
}


