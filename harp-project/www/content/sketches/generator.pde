int[] sizes = {
  3, 5, 7
}; // sizes for our 3 circles
int[] populations = {
  80, 40, 15
}; // number of each circle

void setup() {
  size(300, 300);
  generate();
}

$("button").click(function() {
	generate();
});

void generate() {
  background(255);
  noFill();
  stroke(0);
  //first focus
  for (int i=0; i<sizes.length; i++) {
    for (int n=0; n<populations[i]/3; n++) {
      ellipse(random(2*width/3, width), random(2*height/3, height), sizes[i], sizes[i]);
    }
  }

  //second focus
  for (int i=0; i<sizes.length; i++) {
    for (int n=0; n<populations[i]/3*random(0.5, 1.8); n++) {
      ellipse(random(0, 200), random(0, 200), sizes[i], sizes[i]);
    }
  }
  //third focus
  for (int i=0; i<sizes.length; i++) {
    for (int n=0; n<populations[i]/3*random(0.5, 1.8); n++) {
      ellipse(random(150, height), random(150, height), sizes[i], sizes[i]);
    }
  }

  //everywhere
  for (int i=0; i<sizes.length; i++) {
    for (int n=0; n<populations[i]*random(0.5, 1.2); n++) {
      ellipse(random(0, width), random(0, height), sizes[i], sizes[i]);
    }
  }
}
