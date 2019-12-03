class Asteroid extends Floater {
	private int rotSpeed;
	public Asteroid() {
		corners = 6;
		xCorners = new int[] {-11, 7, 13, 6, -11, -5};
		yCorners = new int[] {-8, -8, 0, 10, 8, 0};
		myColor = color(#c0c0c0);
		myCenterX = (int) (Math.random()*600)-1;
		myCenterY = (int) (Math.random()*600)-1; 
		myDirectionX = myDirectionY = 0;
		myPointDirection = (int) (Math.random()*360) - 1;
		rotSpeed = (int)(Math.random()*4) -1;
		accelerate(1);
	}
	public void move() {
		turn(rotSpeed);
		super.move();
	}
	
	public double getCenterX() {return myCenterX;}
	public double getCenterY() {return myCenterY;}
}
