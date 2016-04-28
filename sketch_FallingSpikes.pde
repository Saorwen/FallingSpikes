float lastTimeCheck;
float timeInterval;
float endTime;
int PlayerHealth;
float GreenShift;
float BlueShift;
int textAlpha = 255;
int fadeRate = 2;
int screen;
boolean tryAgain = false;

void setup() {
  size(400, 600);
  lastTimeCheck = millis();
  timeInterval = 4000.0f;
  
  PlayerPos = new PVector(100, 540);
  PlayerVel = new PVector(0, 0);
  PlayerAcc = new PVector(0, 0);
  PlayerHealth = 25;
  GreenShift = (PlayerHealth * 10);
  BlueShift = (PlayerHealth * 10);
 
  int spikeWave = 10;
  spikes = new ArrayList<Spike>();
  for (int i = 0; i < spikeWave; i++) {
    spikes.add(new Spike());
  }
    screen = 1;

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

void textFade() {
  if (millis() > lastTimeCheck + timeInterval) {
    lastTimeCheck = millis();
    fadeRate *= -1;
   }

  textAlpha += fadeRate;
}


void draw() {
  background(130);
  fill(0);
  noStroke();
  textFade();
  
  for (Spike s : spikes) {
   if (screen == 1) {
      s.update();
      s.collide();
    }
    s.render();

 }
   ellipse(PlayerPos.x, PlayerPos.y, 50, 50);
     
   fill(255,GreenShift, BlueShift);
   rect(0, height - 35, width, 35);
   
   println(PlayerHealth);
   if(PlayerHealth < 0) {
     tryAgain = true;
     screen = 2;
   }
   
   if (screen == 2) {
     fill(255, 0, 0, 150);
     rect(0, 0, width, height);
     
     fill(255);
     textSize(40);
     text("Retry?", width/3, height/2);
     
     fill(255, 255, 255, textAlpha);
     textSize(15);
     text("Hit Space To Try Again", width * 0.3, height * 0.75);
     
     if (keyPressed) {
       if (key == ' ') {
         setup();
       }
     }
   }
}
