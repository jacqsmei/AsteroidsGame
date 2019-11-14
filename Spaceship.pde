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
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //rocket animation
    if(keyPressed) {
    	if (key == 'w') {
    		line(-18, 5, -23, 9);
    		line(-18, 0, -23, 0);
    		line(-18, -5, -23, -9);
    	}
    }

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  } 
}
