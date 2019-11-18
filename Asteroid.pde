class Asteroid extends Floater {
	private int rotSpeed;
	public void Asteroid() {
		corners = 6;
		xCorners = new int[] {-11, 7, 13, 6, -11, -5};
		yCorners = new int[] {-8, -8, 0, 10, 8, 0};
		myColor = col(210, 180, 140);
		myCenterX = myCenterY = (int)(Math.random()*300) - 1;
		myDirectionX = myDirectionY = 0;
		myPointDirection = (int) (Math.random()*360) - 1;
		rotSpeed = (int) (Math.random()*720) - 360;
	}
	public void move() {
		turn(rotSpeed);
		super.move();
	}

}

