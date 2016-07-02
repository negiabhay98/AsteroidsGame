//your variable declarations here
public int numAsteroids = 30;
ArrayList <asteroid> belt = new ArrayList <asteroid>();
SpaceShip Endurance = new SpaceShip();
star [] cluster = new star[1500];
ArrayList <bullet> bullets = new ArrayList <bullet> ();
PFont f;
boolean victory = false;


public void setup() 
{
  size(800, 800);
  background(0);
  
  for (int a = 0; a < cluster.length; a++)
  {
    cluster[a] = new star();
  }
  
  for(int i = 0; i < numAsteroids; i++)
  {
    belt.add(new asteroid());
  }
  f = createFont("Impact",18,true);
}


public void draw() 
{
  fill(0, 0, 0, 120);
  rect(0, 0, 800,800);
  Endurance.show();
  Endurance.move();
  if(victory==false)
  {
     if(belt.size()==0)
     {
        victory = true; 
     }
     
  }
  
  for (int i = 0; i < cluster.length; i++)
  {
    cluster[i].show();
  }
  
  for(int a = 0; a < belt.size(); a++) 
  {
    if(dist(belt.get(a).getX(), belt.get(a).getY(), Endurance.getX(), Endurance.getY()) < 30) 
    {
      fill(200,200,200);
      textFont(f,50);
      text("Y O U   D I E D E D", 300, 400);
      Endurance.setX(400);
      Endurance.setY(400);
      Endurance.setDirectionX(0);
      Endurance.setDirectionY(0);
    }
    for(int b = 0; b < bullets.size(); b++) 
    {
      if(dist(belt.get(a).getX(), belt.get(a).getY(), bullets.get(b).getX(), bullets.get(b).getY()) < 20) 
      {
        belt.remove(a);
        bullets.remove(b);
        break;
      }
    }
  }
  for(int a = 0; a < belt.size(); a++) 
  {
    belt.get(a).show();
    belt.get(a).move();
  }
  for(int b = 0; b < bullets.size(); b++) 
  {
    bullets.get(b).show();
    bullets.get(b).move();
  }
}
  
  
public void keyPressed()
  {
    if(keyCode == UP)
    {
      Endurance.accelerate(0.25);
    }
    if(keyCode == DOWN)
    {
      Endurance.accelerate(-0.25);
    }
    if(keyCode == RIGHT)
    {
      Endurance.rotate(10);
    }
    if(keyCode == LEFT)
    {
      Endurance.rotate(-10);
    }
    if(key == 'h')
    {
      Endurance.setX((int)(Math.random()*800));
      Endurance.setY((int)(Math.random()*800));
      Endurance.setDirectionX(0.0);
      Endurance.setDirectionY(0.0);
      Endurance.setPointDirection((int)(Math.random()*360));
    }
    else if(keyCode == 32) 
    {
    bullets.add(new bullet(Endurance));
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
      
      void move () 
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
}

class asteroid extends Floater 
{
  private int rotSpeed;
  public asteroid() 
  {   
    rotSpeed = (int)(Math.random()*20)-10;
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -30;
    yCorners[0] = -15;
    xCorners[1] = -15;
    yCorners[1] = -30;
    xCorners[2] = 15;
    yCorners[2] = -30;
    xCorners[3] = 30;
    yCorners[3] = -15;
    xCorners[4] = 30;
    yCorners[4] = 15;
    xCorners[5] = 15;
    yCorners[5] = 30;
    xCorners[6] = -15;
    yCorners[6] = 30;
    xCorners[7] = -30;
    yCorners[7] = 15;

    myColor = color(100, 100, 100);   
    myCenterX = (int)(Math.random()*1000);
    myCenterY = (int)(Math.random()*600);
    myDirectionX = (int)(Math.random()*3)-1;
    myDirectionY = (int)(Math.random()*3)-1;
  }
    public void move()
    {
      rotate(rotSpeed);
      super.move();
      
      if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width; 
    }
    if(myCenterY >height)
    {    
      myCenterY = 0;  
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height; 
    }
    }
    public void setX(int x){myCenterX = x;}    
    public void setY(int y){myCenterY = y;}
    public void setDirectionX(double x) {myDirectionX = x;}
    public void setDirectionY(double y){myDirectionY = y;} 
    public void setPointDirection(int degrees) {myPointDirection = degrees;}    

    public int getX() {return (int)myCenterX;}
    public int getY() {return (int)myCenterY;}
    public double getDirectionX() {return myDirectionX;}   
    public double getDirectionY() {return myDirectionY;}   
    public double getPointDirection() {return myPointDirection;} 
}

class bullet extends Floater
 {
    public bullet(SpaceShip pew)
    {
      myCenterX = pew.getX();
      myCenterY = pew.getY();
      myPointDirection = pew.getPointDirection();
      double dRadians = myPointDirection*(Math.PI/180);
      myDirectionX = 5*Math.cos(dRadians) + pew.getDirectionX();
      myDirectionY = 5*Math.sin(dRadians) + pew.getDirectionY();
    }
 
  public void setX(int x){myCenterX = x;}    
  public void setY(int y){myCenterY = y;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public void setDirectionY(double y){myDirectionY = y;} 
  public void setPointDirection(int degrees) {myPointDirection = degrees;}    

  public int getX() {return (int)myCenterX;}
  public int getY() {return (int)myCenterY;}
  public double getDirectionX() {return myDirectionX;}   
  public double getDirectionY() {return myDirectionY;}   
  public double getPointDirection() {return myPointDirection;} 

  public void show()
  {
    fill(101,200,63);
    noStroke();
    ellipse((float)myCenterX,(float)myCenterY,5,5);
  }

  public void move()
  {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
  }
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
