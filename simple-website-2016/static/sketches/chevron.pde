boolean first = true;
int delay = 0;
int x0, y0, x1, y1;
int animX = 0;
int oldH, oldW;
int mX=-100, mY=-100;
ArrayList chevrons;
boolean up = true;
ColorSet cset;

void setup() {
  oldH= $(document).height();
  oldW= $(document).width();
  size($(document).width(), $(document).height());
  
  noStroke();
  chevrons = new ArrayList();
  cset = new ColorSet();
  
  // starting coordinates
  x0 = 0;
  x1 = x0+80;
  y0 = 0;
  y1 = -32;
  
  // filling in the document
  populate();
  
  // resetting for animation
  animX = 0;
}

// sneaking some jquery in here, don't mind me...
$(window).resize(function(){
  if($(window).height()>oldH)
    setup();
  if($(window).width()>oldW)
    setup();
});

void mouseMoved() {
	mX = mouseX;
	mY = mouseY;
}

void draw() {
	background(255);
	fill(200);
	
	for(int i=0; i<chevrons.size(); i++) {
		Chevron c = (Chevron)chevrons.get(i);
		c.draw();
	}

	int r = (int) random(0, chevrons.size());
	Chevron c = (Chevron)chevrons.get(r);
	c.setColor(cset.getRandomColorWithAlpha(random(40, 90)));

}

void mouseMoved() {
	mX = mouseX;
	mY = mouseY;
}

void populate() {

  while(y0 < (height+36)) {
	if(up)
		chevrons.add(new Chevron(x0, x1, y0, y1, up));
	else
		chevrons.add(new Chevron(x0, x1, y1, y0, up));
	
	x0 += 88;
	x1 += 88;
	
	if(x0 > width) {
		x0 = 0;
		x1 = 80;
		y0 += 44;
		y1 += 44;
		up = false;
	}
	index++;
	up = !up;
	}
}

class Chevron {
	int x0, x1, y0, y1;
	color c = color(220);
	boolean up;
	boolean set = false;
	
	Chevron(x0, x1, y0, y1, up) {
		this.x0 = x0;
		this.x1 = x1;
		this.y0 = y0;
		this.y1 = y1;
		this.up = up;
	}
	
	void setColor(c) {
		if(!this.set)
			this.c = c;
	}
	
	void fadeIn() {
		this.fading = true;
	}
	
	void draw() {



		fill(this.c);
		quad(x0, y0, x1, y1, x1, y1+38, x0, y0+38);
	}
}