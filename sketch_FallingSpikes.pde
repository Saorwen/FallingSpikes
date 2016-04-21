void setup() {
  size(400, 600);
  PlayerPos = new PVector(100, 540);
  PlayerVel = new PVector(0, 0);
  PlayerAcc = new PVector(0, 0);
  
  int spikeWave = 10;
  spikes = new ArrayList<Spike>();
  for (int i = 0; i < spikeWave; i++) {
    spikes.add(new Spike());
  }
}

PVector PlayerPos;
PVector PlayerVel;
PVector PlayerAcc;

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
  }
  
   ellipse(PlayerPos.x, PlayerPos.y, 50, 50);
   
   fill(255);
   rect(0, height - 35, width, 35);
}
