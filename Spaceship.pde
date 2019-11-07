class Spaceship extends Floater  
{    
  public Spaceship() {
  	corners = 11;
  	int[] xS = {16, 12, -2, -2, -10, -14, -14, -10, -2, -2, 12};
  	int[] yS = {0, 3, 3, 5, 5, 7, -7, -5, -5, -3, -3};
  	xCorners = xS;
  	yCorners = yS;
  	myColor = color(255, 255, 255);
  	myCenterX = myCenterY = 300;
  	myDirectionX = myDirectionY = 0;
  	myPointDirection = 0;
  }
  public void setDirectionX(double x) {
  	myDirectionX = x;
  }
  public void setDirectionY(double y) {
  	myDirectionY = y;
  }
  public void hyperspace() {
  	myCenterX = Math.random()*600+1;
  	myCenterY = Math.random()*600+1;
  }	
}
