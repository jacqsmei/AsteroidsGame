class Star //note that this class does NOT extend Floater
{
  private int myColor, myX, myY, myR;
  public Star() {
  	myColor = color(255, 255, 255);
  	myX = (int) (Math.random()*600) + 1;
  	myY = (int) (Math.random()*600) + 1;
  	myR = (int) (Math.random()*7) + 1;
  }
  public void show() {
  	noStroke();
  	fill(myColor);
  	ellipse(myX, myY, myR, myR);
  }
}
