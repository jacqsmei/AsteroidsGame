class Bullet extends Floater {
	private double dRadians;
	public Bullet(Spaceship theShip) {
		myCenterX = theShip.getCenterX();
		myCenterY = theShip.getCenterY();
		myColor = color(255, 255, 0);
		myPointDirection = theShip.getPointDirection();
		dRadians = myPointDirection*(Math.PI/180);
		myDirectionX = 5*Math.cos(dRadians) + theShip.getDirectionX();
		myDirectionY = 5*Math.sin(dRadians) + theShip.getDirectionY();
	}
	public void show() {
		noStroke();
		fill(myColor);
		ellipse((float)myCenterX, (float)myCenterY, 5, 5);
	}
	public double getCenterX() {return myCenterX;}
	public double getCenterY() {return myCenterY;}
}