void setup() {
  size(400, 600);
  PlayerPos = new PVector(100, 540);
  PlayerVel = new PVector(0, 0);
  PlayerAcc = new PVector(0, 0);
}

PVector PlayerPos;
PVector PlayerVel;
PVector PlayerAcc;
float[] spikes;
float deltaTime = 1.0f/60.0f;

void fallingSpikes() {
  PVector pos;
  PVector vel;
  PVector acc;
   
}

void  mouseDragged() {
  PlayerPos.x = mouseX;
}


void draw() {
  background(0);
  ellipse(PlayerPos.x, PlayerPos.y, 50, 50);
}
