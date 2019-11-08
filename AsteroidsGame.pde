//your variable declarations here
Spaceship uwu;
public void setup() 
{
  size(600, 600);
  background(0);
  uwu = new Spaceship();
}
public void draw() 
{
  background(0);
  uwu.show();
  uwu.move();
  if (!keyPressed) {
	uwu.setDirectionX(0);
  	uwu.setDirectionY(0);
  }
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
  if (key == CODED) {
  	if (keyCode == SHIFT) {
  		uwu.hyperspace();
  	}
  }
}


  	
