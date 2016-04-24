float lastTimeCheck;
float timeInterval;
int PlayerHealth;
float GreenShift;
float BlueShift;
int screen;
boolean tryAgain = false;

void setup() {
  size(400, 600);
  lastTimeCheck = millis();
  timeInterval = 300.0f;
  
  PlayerPos = new PVector(100, 540);
  PlayerVel = new PVector(0, 0);
  PlayerAcc = new PVector(0, 0);
  PlayerHealth = 100;
  GreenShift = (PlayerHealth * 2.5);
  BlueShift = (PlayerHealth * 2.5);
 
  int spikeWave = 10;
  spikes = new ArrayList<Spike>();
  for (int i = 0; i < spikeWave; i++) {
    spikes.add(new Spike());
  }
 
  if (!tryAgain) {
    screen = 1;
  }
 else {
   screen = 2;
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
   if (screen == 1) {
      s.update();
    }
    s.render();
    s.collide();
}
   ellipse(PlayerPos.x, PlayerPos.y, 50, 50);
     
   fill(255,GreenShift, BlueShift);
   rect(0, height - 35, width, 35);
   
   println(PlayerHealth);
   if(PlayerHealth < 0) {
     tryAgain = true;
     setup();
   }
   
   if (screen == 2) {
     fill(255, 0, 0, 150);
     rect(0, 0, width, height);
     
     fill(255);
     textSize(40);
     text("Retry?", width/3, height/2);
     
     if (keyPressed) {
       if (key == ' ') {
         screen = 1;
       }
     }
   }
}
