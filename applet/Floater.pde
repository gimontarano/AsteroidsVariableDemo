abstract class Floater
{
  protected int[] xCorners;
  protected int[] yCorners;
  protected int corners;  //the number of corners, a triangular floater has 3
  protected int myColor;
  protected double myCenterX, myCenterY; //holds center coordinates
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel
  protected double myPointDirection; //holds current direction the ship is pointing in degrees

  abstract public void setX(int x);
  abstract public int getX();
  abstract public void setY(int y);
  abstract public int getY();
  abstract public void setDirectionX(double x);
  abstract public double getDirectionX();
  abstract public void setDirectionY(double y);
  abstract public double getDirectionY();
  abstract public void setPointDirection(int degrees);
  abstract public double getPointDirection();

  public void accelerate (double dAmount)
  {  
    //Accelerates the floater in the direction it is pointing
    //(myPointDirection)

    //convert the current direction the floater is pointing to radians
    double dRadians =myPointDirection*(Math.PI/180);

    //change coordinates of direction of travel
    myDirectionX += ((dAmount) * Math.cos(dRadians));
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }
  void rotate (int nDegreesOfRotation)
  {  
    //rotates the floater by a given number of degrees
    myPointDirection+=nDegreesOfRotation;
  }
  public void move ()
  {  
    //Moves the floater towards the coordinates
    //myDirectionX and myDirectionY

    //move the floater in the current direction of travel
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;

    //wrap around screen
    if(myCenterX >width) {
      myCenterX = 0;
    }
    else if (myCenterX<0) {
      myCenterX = width;
    }
    if(myCenterY >height) {
      myCenterY = 0;
    }
    else if (myCenterY < 0) {
      myCenterY = height;
    }
  }
  public void show (boolean isHyperspace, int countDown, boolean jets)
  {  
    //Draws the floater at the current position
    if(isHyperspace == false)
    {
      fill(myColor);
      stroke(myColor);
    }
    else
    {
      fill(255,255,255,60 - countDown);
      stroke(255,255,255,60 - countDown);
    }
    //convert degrees to radians for sin and cos     
    double dRadians = myPointDirection*(Math.PI/180);

    int xRotatedTranslated, yRotatedTranslated;
    beginShape();

    //rotate and translate the coordinates of the floater using current direction	
    for(int nI = 0; nI < corners; nI++)
    {
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY); 
      vertex(xRotatedTranslated,yRotatedTranslated);
    }


    endShape(CLOSE);

    int xStart = (int)((-12* Math.cos(dRadians)) - (0 * Math.sin(dRadians))+myCenterX);
    int yStart = (int)((-12* Math.sin(dRadians)) + (0 * Math.cos(dRadians))+myCenterY);
    int xEnd = (int)((-18* Math.cos(dRadians)) - (0 * Math.sin(dRadians))+myCenterX);
    int yEnd = (int)((-18* Math.sin(dRadians)) + (0 * Math.cos(dRadians))+myCenterY);
    int xStart2 = (int)((-12* Math.cos(dRadians)) - (5 * Math.sin(dRadians))+myCenterX);
    int yStart2 = (int)((-12* Math.sin(dRadians)) + (5 * Math.cos(dRadians))+myCenterY);
    int xEnd2 = (int)((-18* Math.cos(dRadians)) - (8 * Math.sin(dRadians))+myCenterX);
    int yEnd2 = (int)((-18* Math.sin(dRadians)) + (8 * Math.cos(dRadians))+myCenterY);
    int xStart3 = (int)((-12* Math.cos(dRadians)) - (-5 * Math.sin(dRadians))+myCenterX);
    int yStart3 = (int)((-12* Math.sin(dRadians)) + (-5 * Math.cos(dRadians))+myCenterY);
    int xEnd3 = (int)((-18* Math.cos(dRadians)) - (-8 * Math.sin(dRadians))+myCenterX);
    int yEnd3 = (int)((-18* Math.sin(dRadians)) + (-8 * Math.cos(dRadians))+myCenterY);
    if(jets)
    {
      line(xStart,yStart,xEnd,yEnd);
      line(xStart2,yStart2,xEnd2,yEnd2);
      line(xStart3,yStart3,xEnd3,yEnd3);
    }
  }
}

