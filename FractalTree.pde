private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = Math.PI/8;
private int r = 255;
private int g = 255;
private int b = 255;
private int count = 0;
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);
	stroke(r, g, b);
	strokeWeight(5);
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength = branchLength*fractionLength;
	int endX1 = (int)(x + branchLength*(Math.cos(angle1)));
	int endY1 = (int)(y + branchLength*(Math.sin(angle1)));
	int endX2 = (int)(x + branchLength*(Math.cos(angle2)));
	int endY2 = (int)(y + branchLength*(Math.sin(angle2)));
	stroke(r, g, b);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	count++;
	if(count%10 == 0) {
		r-=(int)(Math.random()*3);
		g-=(int)(Math.random()*3);
		b-=(int)(Math.random()*3);
	}
	if (branchLength > smallestBranch) {
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
} 
