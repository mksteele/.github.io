int[] sizes = {
  25, 20, 30
}; // sizes for our 3 circles
boolean first = true;
int index = 0;
int delay = 0;
int oldH, oldW;
int mX=-100, mY=-100;
Dot[] confetti;
ColorSet cset;

void setup() {
  if($("#last").offset().top+$("#last").height() != ($(document).height()+50))
    $("#last").css("padding-bottom", "50px");
  oldH= $(document).height();
  oldW= $(document).width();
  size($(document).width(), $(document).height());
  //size(800, 800);
  noStroke();
  index = 0;
  confetti = new Dot[600];
  cset = new ColorSet();
}

// sneaking some jquery in here, don't mind me...
$(window).resize(function(){
  if($(window).height()>oldH)
    setup();
  if($(window).width()>oldW)
    setup();
});

$(window).bind("load", function() {
  setup();
});
void mouseMoved() {
	mX = mouseX;
	mY = mouseY;
}

void draw() {
  background(255);

  for(int i=0; i<index; i++) {
	if(confetti[i] != null) {
	    confetti[i].draw();
		confetti[i].fall();
	}
  }
  
  if(delay == 0) {
	delay = 300;
	for(int i=0; i<15; i++) {
		confetti[index] = new Dot(index, sizes[(int)random(0, sizes.length)]);
		if(index++ == 600)
			index = 0;
	}
  }
  delay--;
}

class Dot {
  color c;
  int opacity;
  int i, d, randn=0;
  float x, y, size;
  float velX, velY;

  Dot(int i, float size) {
	this.i = i;
    this.size = size;

    // placing somewhere in buffer range
    this.x = random(0, width);
    this.y = random(-200, -10);
	
    this.velX = 0;
    this.velY = random(0.5, 0.8);
	
	this.opacity = (int)(random(200))+50;
    this.c = cset.getRandomColor();
  }

  void draw() {
    fill(this.c, opacity);
    ellipse(x, y, size, size);   
  }

  void fall() {
    if(abs(mX-this.x)<50 && abs(mY-this.y)<50) {
  		if(randn==0) randn = random(4, 16);
  		d = 42;
	   }
  	if(d > 0) {
  		this.velX = sin(frameCount/randn);
  		d--;
  	}
  	else {
  		randn = 0;
  		this.velX = 0;
  	}
	  this.x += velX;
    this.y += velY;
    if(this.y-this.size > height+20)
      confetti[i] = null;
  }
}