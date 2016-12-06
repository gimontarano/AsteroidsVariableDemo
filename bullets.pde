class Bullets extends Floater
{
  private int intX;
  private int intY;
  Bullets()
  {
    corners = 1;
    myCenterX = 250;
    intX = (int)(myCenterX);
    myCenterY = 250;
    intY = (int)(myCenterY);
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    xCorners = intX;
    yCorners = intY;
    myColor = color(255,255,255);
    
  }
  public void setX(int x)
  {
    myCenterX = x;
  }
  public int getX()
  {
    return (int) myCenterX;
  }
  public void setY(int y)
  {
    myCenterY = y;
  }
  public int getY()
  {
    return (int) myCenterY;
  }
  public void setDirectionX(double x)
  {
    myDirectionX = x;
  }
  public double getDirectionX()
  {
    return myDirectionX;
  }
  public void setDirectionY(double y)
  {
    myDirectionY = y;
  }
  public double getDirectionY()
  {
    return myDirectionY;
  }
  public void setPointDirection(int degrees)
  {
    myPointDirection = degrees;
  }
  public double getPointDirection()
  {
    return myPointDirection;
  }