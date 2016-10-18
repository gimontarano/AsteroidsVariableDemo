/**
Prese 5 to accelerate<br>
Press 4 or 6 to rotate<br>
Press 2 for hypserspace
*/
SpaceShip bob;
Stars stars;
boolean isAccelerating = false;
boolean isRotatingLeft = false;
boolean isRotatingRight = false;
boolean isHyperspace = false;

int countDown = 60;
void setup()
{
  size(500,500);
  bob = new SpaceShip();
  stars = new Stars();
  textSize(24);
}
void draw()
{
  if(!isHyperspace)
  {
  background(0);
  }
  else
  {
    fill(0,0,0,10);
    stroke(0,0,0,10);
    rect(0,0,width,height);
    countDown--;
    if(countDown == 0)
    {
      isHyperspace = false;
    }
  }
  if(keyPressed == true && key == '2') 
    countDown = 60;
  stars.show();
  bob.show(isHyperspace,countDown,isAccelerating);
  bob.move();
  if(isAccelerating == true)bob.accelerate(.1);
  if(isRotatingLeft == true)bob.rotate(-5);
  if(isRotatingRight == true)bob.rotate(5);
  stroke(255);
  text("myCenterX: "+ bob.getX(),10,20);
  text("myCenterY: "+ bob.getY(),10,40);
  text("myPointDirection: "+ bob.getPointDirection(),10,60);
  text("myDirectionX: "+ (int)(bob.getDirectionX()*100)/100.0,10,80);
  text("myDirectionY: "+ (int)(bob.getDirectionY()*100)/100.0,10,100);
}
void keyPressed()
{
  if(key == '5') isAccelerating = true;
  if(key == '4') isRotatingLeft = true;
  if(key == '6') isRotatingRight = true;
  if(key == '2')
  {
    bob.setX((int)(Math.random() * width));
    bob.setY((int)(Math.random() * height));
    bob.setPointDirection((int)(Math.random() * 360));
    bob.setDirectionX(0);
    bob.setDirectionY(0);
    isHyperspace = true;
    countDown = 60;
  }
}
void keyReleased()
{
  if(key == '5') isAccelerating = false;
  if(key == '4') isRotatingLeft = false;
  if(key == '6') isRotatingRight = false;
}
