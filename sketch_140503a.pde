//Radar using Processing tool.

import processing.serial.*;
Serial myPort;
float angle = 0.0;    //
float speed = 0.025;  // stuff for scan line
float radius = 325.0; //
PFont font;

void setup()
{
 size(600, 600);
 background(5);


 println(Serial.list());

}

void draw()
{
  //frameRate(100);
  fill(0, 50);
  noStroke();
  rect(0, 0, width, height);
  degreeLines(); //draw degree markings
  degreeText(); //draw degree numbers
  circles();
  ellipse(mouseX, mouseY, 5, 5);
  scanLine(); //draw the moving scan line
  blip();
  
  /* // degree marking reference dots
  noStroke();
  smooth();
  fill(250);
  int radius = 300;
  for(int deg = 0; deg<360; deg += 30)
  {
    float angle = radians(deg);
    float x = 300 + (cos(angle) * radius);
    float y = 300 + (sin(angle) * radius);
    ellipse(x,y,3,3);
    
  }
  */
  
}

void drawGrid()
{
  //horizontal lines
  for(int i = 0; i < 480; i=i+30)
  {
    gridProps();
    line(0, i, 640, i); 
  }
  //vertical lines
  for(int i = 0; i < 640; i=i+32)
  {
    gridProps();
    line(i, 0, i, 480); 
  }
}

void gridProps()
{
  stroke(15, 75, 15, 25);
  strokeWeight(0.50);
  smooth();
}

void scanLine(){
  //math for the moving line
  //fill(0, 0);
  //rect(0, 0, width, height);
  angle += speed;
  float sinval = sin(angle);
  float cosval = cos(angle);
  float x = 300 + (cosval * radius);
  float y = 300 + (sinval * radius);
  //draw line from center to radius
  stroke(50, 200, 50);
  strokeWeight(9);
  smooth();
  line(300, 300, x, y);
}

void degreeLines()
{
  stroke(25, 150, 25);
  strokeWeight(3);
  smooth();
  line(300,0,300,600);
  line(475,0,125,600);
  line(600,125,0,475);
  line(600,300,0,300);
  line(600,475,0,125);
  line(475,600,125,0);
}

void circles()
{
  noFill();
  stroke(25, 150, 25);
  strokeWeight(1.5);
  smooth();
  ellipse(300, 300, 50, 50);
  ellipse(300, 300, 150, 150);
  ellipse(300, 300, 250, 250);
  ellipse(300, 300, 350, 350);
  ellipse(300, 300, 450, 450);
  ellipse(300, 300, 550, 550);
  ellipse(300, 300, 650, 650); 
}

void degreeText()
{
  smooth();
  fill(25, 150, 25);
  text("0", 310, 20);
  text("30", 450, 65);
  text("60", 550, 170);
  text("90", 580, 317);
  text("120", 533, 463);
  text("150", 420, 563);
  text("180", 272, 592);
  text("210", 128, 547);
  text("240", 30, 440);
  text("270", 1, 295);
  text("300", 46, 147);
  text("330", 157, 48);
}

void blip() 
{
  //shift origin (0,0) to center of window
  translate(width/2, height/2);
  // get the ASCII string until the linebreak:
  
  // if there is something there, than  do stuff

  {
    // trim off any whitespace:

    // convert string values to float

    //convert float to inches

    // print float values

    fill(50, 200, 50);
    strokeWeight(3);

  }
}
