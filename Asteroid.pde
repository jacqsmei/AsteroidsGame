class Asteroid extends Floater {
	private int rotSpeed;
	private int astType;

	public Asteroid() {
		astType = (int) (Math.random()*3)+1;
		corners = 6;
		if (astType == 1) {
			xCorners = new int[] {-11, 7, 13, 6, -11, -5};
			yCorners = new int[] {-8, -8, 0, 10, 8, 0};
		} else if (astType == 2) {
			xCorners = new int[] {-11, 0, 7, 13, 5, -12};
			yCorners = new int[] {-8, -7, 0, 7, 8, 2};
		} else if (astType == 3) {
			xCorners = new int[] {0, 7, 7, 0, -7, -7};
			yCorners = new int[] {-10, -8, 8, 10, 8, -8};
		}
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
