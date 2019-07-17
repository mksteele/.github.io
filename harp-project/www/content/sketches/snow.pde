
int[] sizes = {
  3, 5, 7
}; // sizes for our 3 circles

int index = 0, bufferH = 50;
int oldH, oldW;
Dot[] snow;

void setup() {
  if($("#last").offset().top+$("#last").height() != ($(document).height()+50))
    $("#last").css("padding-bottom", "50px");
    
  $("#container").height($(document).height());
  oldH= $(document).height();
  oldW= $(window).width();
  size(oldW, oldH);
  
  noStroke();

  snow = new Dot[715];
  generate();
}

$(window).bind("load", function() {
  setup();
});
$(window).resize(function(){
  if($(window).height()>oldH)
    setup();
  if($(window).width()>oldW)
    setup();
});


void generate() {
  index = 0;
  snow = new Dot[715];
  
  // should make them randomly here -- across the top only?
  for (int i=0; i<sizes.length; i++) {
    for(int j=0; j<300; j++) {
      snow[index] = new Dot(sizes[i]);
      index++;
    }
  }
}

void draw() {
 // background(47, 64, 142);

  background(10, 40, 100);
  for(int i=0; i<index; i++) {
    snow[i].draw();
    snow[i].fall();
  }
}

class Dot {
  boolean first=true;
  float x, y, size;
  int opacity;
  float velX, velY;
  float rot, skewX, skewY;
  boolean blink;

  Dot(float size) {
    this.size = size;
    this.makeDot();
  this.first = false;
  }

  void makeDot() {
    this.blink = true;
    this.opacity = (int)(random(200))+50;
    // setting x and y somewhere in the buffer range
    this.x = random(0, width);
  if(this.first)
    this.y = random(-50, height);
  else
    this.y = random(-200, -10);
    this.velX = 0;
    this.velY = random(0.2, 0.8);
  }

  void draw() {
    if(this.blink)
      this.opacity -=1;
    if(this.opacity < 50) {
      this.blink = true;
      this.opacity = (int)(random(200))+50;
    }
    
    fill(255, opacity);
    ellipse(x, y, size, size);
    
  }

  void fall(int X, int Y) {

    if(this.y-this.size > height+20)
      this.makeDot();

    this.x += velX;
    this.y += velY;
  }
}