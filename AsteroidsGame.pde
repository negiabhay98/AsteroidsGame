//your variable declarations here
SpaceShip Trump = new SpaceShip();
star [] cluster = new star[400];
public void setup() 
{
  size(800, 800);
  background(0);
  for (int a = 0; a < cluster.length; a++)
  {
    cluster[a] = new star();
  }
}
public void draw() 
{
  fill(0, 0, 0, 120);
  rect(0, 0, 800,800);
  Trump.show();
  Trump.move();
  for (int a = 0; a < cluster.length; a++)
  {
    cluster[a].show();
  }
}
public void keyPressed()
  {
    if(keyCode == UP)
    {
      Trump.accelerate(0.25);
    }
    if(keyCode == DOWN)
    {
      Trump.accelerate(-0.25);
    }
    if(keyCode == RIGHT)
    {
      Trump.rotate(10);
    }
    if(keyCode == LEFT)
    {
      Trump.rotate(-10);
    }
    if(key == 'h')
    {
      Trump.setX((int)(Math.random()*800));
      Trump.setY((int)(Math.random()*800));
      Trump.setDirectionX(0.0);
      Trump.setDirectionY(0.0);
      Trump.setPointDirection((int)(Math.random()*360));
    }
  }
class SpaceShip extends Floater  
{   
    public SpaceShip()
    {
      corners = 3;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners [0] = 20;
      yCorners [0] = 0;
      xCorners [1] = -10;
      yCorners [1] = 10;
      xCorners [2] = -10;
      yCorners [2] = -10;
      myColor = color(214, 255, 82);
      myCenterX = 400;
      myCenterY = 400;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
    }
      public void setX(int x){myCenterX = x;}  
      public int getX(){return (int)myCenterX;}   
      public void setY(int y){myCenterY = y;} 
      public int getY() {return((int)myCenterY);}  
      public void setDirectionX(double x) {myDirectionX = 0;}  
      public double getDirectionX() {return ((int)myDirectionX);}  
      public void setDirectionY(double y) {myDirectionY = 0;} 
      public double getDirectionY() {return (int)myDirectionY;}
      public void setPointDirection(int degrees) {myPointDirection = degrees;}  
      public double getPointDirection() {return (int)myPointDirection;}
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
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

  
  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move () 
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;
      for(int i= 0; i < cluster.length; i++)
        cluster[i].reset();    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;
      for(int i= 0; i < cluster.length; i++)
        cluster[i].reset();      
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;  
      for(int i= 0; i < cluster.length; i++)
        cluster[i].reset();    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height; 
      for(int i= 0; i < cluster.length; i++)
        cluster[i].reset();    
    }   
  }   
  public void show ()   
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }  
} 
public class star
{
  private int myX = 400;
  private int myY = 400;
  private int mySize = 1;
  star ()
  {
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
    mySize = (int)(Math.random()*4);
  }
  public void show()
  {
    fill (255, 255, 255);
    noStroke();
    ellipse(myX, myY, mySize, mySize);
  }
  public void reset()
  {
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
    mySize = (int)(Math.random()*4);
  }
}
