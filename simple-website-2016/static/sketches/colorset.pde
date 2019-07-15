class ColorSet {
  color[] colors;
  ColorSet() {
    colors = new color[20];
    colors[0] = color(255, 112, 103); //tomato
    colors[1] = color(255, 180, 162); //red 1
    colors[2] = color(255, 207, 203); //red 2
    colors[3] = color(237, 254, 28); //yellow-green 
    colors[4] = color(132, 232, 61); //nice green 
    colors[5] = color(255, 253, 44); //yellow
    colors[6] = color(255, 208, 38); //orange-yellow
    colors[7] = color(254, 143, 1); //orange
    colors[8] = color(50, 179, 200); //teal
    colors[9] = color(101, 209, 237); //aqua
    colors[10] = color(130, 224, 246); //tiffany blue
    colors[11] = color(215, 238, 244); //lightest blue
    colors[12] = color(223, 157, 204); //lilac
    colors[13] = color(248, 123, 144); //pink
    colors[14] = color(203, 77, 206); //purple
    colors[15] = color(255, 131, 113); //salmon
    colors[16] = color(255, 136, 148); //salmon-pink
    colors[17] = color(50, 177, 65); //classic green 
    colors[18] = color(0, 163, 91); //forest green
    colors[19] = color(113, 204, 81); //green flash
  }
	color getRandomColor() {
	  int rand = (int) random(0, colors.length);
	  return colors[rand];
	}
	
	color getRandomColorWithAlpha(a) {
		int rand = (int) random(0, colors.length);
		return color(red(colors[rand]), green(colors[rand]), blue(colors[rand]), a);
	}
}
