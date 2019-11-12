class Spaceship extends Floater  
{    
  public Spaceship() {
  	corners = 11;
  	xCorners = new int[] {16, 12, -2, -2, -10, -14, -14, -10, -2, -2, 12};
  	yCorners = new int[] {0, 3, 3, 5, 5, 7, -7, -5, -5, -3, -3};
  	myColor = color(225, 225, 235);
  	myCenterX = myCenterY = 300;
  	myDirectionX = myDirectionY = 0;
  	myPointDirection = 0;
  }
  public double getDirectionX() {return myDirectionX;}
  public double getDirectionY() {return myDirectionY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public void hyperspace() {
  	myCenterX = Math.random()*600+1;
  	myCenterY = Math.random()*600+1;
  }	
}
