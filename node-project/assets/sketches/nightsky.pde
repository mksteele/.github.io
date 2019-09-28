int[] sizes = {
  3, 5, 7
}; // sizes for our 3 circles
int[] populations = {
  200, 85, 55
}; // number of each circle
int index = 0;

int X, Y, nX, nY, oldH, oldW;
int delay = 64;
Star[] stars;

int topBuffer = 140;

void setup() {
  //$("#container").height($(document).height()+40);

  // Trying to do something intelligent here on resize
  // Either we start out with too few stars, or 
  //oldH= $(document).height() + topBuffer;
  //oldW= $(document).width();
  size($("#bg").width(), $("#bg").height());
  console.log("bg height");
  console.log($("#bg").height());
  noStroke();
  X = width / 2;
  Y = height / 2;
  nX = X;
  nY = Y;  
  //stars = new Star[715];
  generate();
}

$(window).bind("load", function() {
  setup();
});
/**
$(window).resize(function(){
  if($(window).height()>oldH)
    setup();
  if($(window).width()>oldW)
    setup();
});
**/
void generate() {
  index = 0;
  stars = new Star[715];
  //int index=0;
  //first focus
  for (int i=0; i<sizes.length; i++) {

    float velX = 0.1*random(-1, 1);
    float velY = 0.1*random(-1, 1);
    for (int n=0; n<populations[i]/3; n++) {
      stars[index] = new Star(random(2*width/3, width), random(2*height/300, height), sizes[i], (int)(random(255)), velX, velY);
      index++;
    }
  }
  
  //second focus
  for (int i=0; i<sizes.length; i++) {
    float velX = 0.1*random(-1, 1);
    float velY = 0.1*random(-1, 1);
    for (int n=0; n<populations[i]/3*random(0.5, 1.8); n++) {
      stars[index] = new Star(random(0, width/5), random(0, height/5), sizes[i], (int)(random(255)), velX, velY);
      index++;
    }
  }
  

  //third focus
  for (int i=0; i<sizes.length; i++) {
    float velX = 0.1*random(-1, 1);
    float velY = 0.1*random(-1, 1);
    for (int n=0; n<populations[i]/3*random(0.5, 1.8); n++) {
      stars[index] = new Star(random(width/3+width/4, 2*width/3+width/4), random(width/4, height/2), sizes[i], (int)(random(255)), velX, velY);
      index++;
    }
  }
  
  //everywhere
  for (int i=0; i<sizes.length; i++) {
    float velX = 0.1*random(-1, 1);
    float velY = 0.1*random(-1, 1);
    for (int n=0; n<populations[i]*random(0.5, 1.2); n++) {
      // Vel multiplier = *this.size/2;
      stars[index] = new Star(random(-50, width+50), random(-50, height+50), sizes[i], (int)(random(255)), velX, velY);
      index++;
    }
  }
}

void draw() {
  background(0);
 // Track circle to new destination
  if(nX-X > 50 || nX-X < -50)
    X+=(nX-X)/delay;
  
  if(nY-Y > 50 || nY-Y < -50)
    Y+=(nY-Y)/delay;

  for(int i=0; i<index; i++) {
    stars[i].draw();
    stars[i].drift((nX-X)/delay, (nY-Y)/delay);
  }
}

class Star {
  boolean offscreen=false;
  float x, y, size;
  int opacity, delayCnt=0;
  float velX, velY;

  Star(float x, float y, float size, int opacity, float velX, float velY) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.opacity = opacity;
    this.velX = velX;
    this.velY = velY;
  }
  void draw() {
    fill(255, opacity);
    ellipse(x, y, size, size);
  }
  void drift(int X, int Y) {
    if(this.x-this.size > width+100)
      this.x = -this.x;
    if(this.x+this.size < -100)
      this.x = width+100+this.size+this.x;
    if(this.y-this.size > height+100)
      this.y = -this.y;
    if(this.y+this.size < -100)
      this.y = height+100+this.size+this.y;

    this.x += velX-X*0.5;
    this.y += velY-Y*0.5;
    delayCnt++;
  }
}
