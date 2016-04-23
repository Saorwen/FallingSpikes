float lastTimeCheck;
float timeInterval;
int PlayerHealth;

void setup() {
  size(400, 600);
  lastTimeCheck = millis();
  timeInterval = 300.0f;
  
  PlayerPos = new PVector(100, 540);
  PlayerVel = new PVector(0, 0);
  PlayerAcc = new PVector(0, 0);
  PlayerHealth = 500;
  
  int spikeWave = 10;
  spikes = new ArrayList<Spike>();
  for (int i = 0; i < spikeWave; i++) {
    spikes.add(new Spike());
  }
}

PVector PlayerPos;
PVector PlayerVel;
PVector PlayerAcc;
//color bloodSplat = new color(255, 255 -(PlayerHealth * 5), 255 - (PlayerHealth * 5));
ArrayList<Spike> spikes;

void  mouseDragged() {
  if (mouseX <= (width - 25) && mouseX >= 25) {
    PlayerPos.x = mouseX;
  }
}


void draw() {
  background(130);
  fill(0);
  noStroke();
  
  for (Spike s : spikes) {
    s.update();
    s.render();
    s.collide();
  }
  
   ellipse(PlayerPos.x, PlayerPos.y, 50, 50);
   
   
   fill(255);
   rect(0, height - 35, width, 35);
   
   println(PlayerHealth);
}
