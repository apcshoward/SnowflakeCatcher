Snowflake [] flurry;
int iniX;
int iniY;
void setup()
{
  //your code here
  size(500,500);
  background(49, 79, 79);
  flurry = new Snowflake[200];
  for(int i = 0; i < 200; i++){
    flurry[i] = new Snowflake();
  }
}
void draw()
{
  for(int i = 0; i < 200; i++){
    flurry[i].erase();
    flurry[i].lookDown();
    flurry[i].move();
    flurry[i].wrap();
    flurry[i].show();
  }
}
void mouseDragged()
{
  //your code here
  iniX = mouseX;
  iniY = mouseY; 
  stroke(255);
  strokeWeight(20);
  line(mouseX,mouseY,pmouseX,pmouseY);
}

class Snowflake
{
  //class member variable declarations
  int x, y;
  Boolean isMoving;
  Snowflake()
  {
    //class member variable initializations
    x = (int)(Math.random()*500);
    y = (int)(Math.random()*500);
    isMoving = true;
  }
  void show()
  {
    //your code here
    fill(0);
    noStroke();
    ellipse(x,y,5,5);
  }
  void lookDown()
  {
    //your code here
    if(y >= 0 && y <= 505 && get(x,y+3) == color(49, 79, 79)){
      isMoving = true;
    }
    else {
      isMoving = false;
    }
  }
  void erase()
  {
    if(isMoving){
     fill(49, 79, 79);
     noStroke();
     ellipse(x,y,7,7);
    }
  }
  void move()
  {
    if(isMoving)
      y += 3;
  }
  void wrap()
  {
    //your code here
    if(y >= 496){
      y = 0;
      x = (int)(Math.random()*500);
      isMoving = true;
    }
  }
}
void keyPressed() 
{
  if(keyCode == 32){
    for(int i = 0; i < 200; i++){
      flurry[i] = new Snowflake();
    }
  }
  if(keyCode == 68){
    background(49, 79, 79);
  }
}