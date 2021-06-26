GameEnvironment g;

void setup() {

  size(900, 400);
  background(0);
  g=new GameEnvironment();
}

void draw() {
  background(0);
  g.update();
}

void keyPressed() {
  g.keyInput();
}