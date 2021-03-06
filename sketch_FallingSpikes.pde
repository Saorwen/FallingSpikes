float lastTimeCheck;
float timeInterval;
float timeInterval2;
float startTime;
float endTime;
int PlayerHealth;
float GreenShift;
float BlueShift;
int textAlpha = 100;
int fadeRate = 4;
float playerSpeed = 1;
float playerAcc = 0.2;
int screen;
int spikeWave;
boolean start = true;
PImage startScreen;

void setup() {
  size(400, 600);
  lastTimeCheck = millis();
  timeInterval = 2000.0f;
  timeInterval2 = 5000.0f;
  startTime = millis();
  endTime = 0.0f;
  startScreen = loadImage("StartScreen.png");
  
  PlayerPos = new PVector(100, 540);
  PlayerVel = new PVector(0, 0);
  PlayerAcc = new PVector(0, 0);
  PlayerHealth = 25;
  GreenShift = (PlayerHealth * 10);
  BlueShift = (PlayerHealth * 10);
 
  spikeWave = 10;
  spikes = new ArrayList<Spike>();
  for (int i = 0; i < spikeWave; i++) {
    spikes.add(new Spike());
  }
  
  if (start == false) {
      screen = 1;
  }
  else {
    screen = 0;
  }

}

PVector PlayerPos;
PVector PlayerVel;
PVector PlayerAcc;
ArrayList<Spike> spikes;

void  mouseDragged() {
 if (screen == 1) {
  playerSpeed = 1;
  if (mouseX <= (width - 25) && mouseX >= 25) {
    PlayerPos.x = mouseX;
    if (mouseY <= height - 75 && mouseY >= height - 200) {
      PlayerPos.y = mouseY;
    }
  }
 }
}

void textFade() {
  if (millis() > lastTimeCheck + timeInterval) {
    lastTimeCheck = millis();
    fadeRate *= -1;
   }

  textAlpha += fadeRate;
}

/*
void waves() {
    if (millis() > lastTimeCheck + timeInterval2) {
      lastTimeCheck = millis();
      spikeWave ++;
      println(spikeWave);
    }
}
*/

void draw() {
  background(130);
  fill(0);
  noStroke();
  
  for (Spike s : spikes) {
   if (screen == 1) {
      s.update();
      s.collide();
    }
    s.render();

 }
 if (screen == 1 || screen == 2) {
   ellipse(PlayerPos.x, PlayerPos.y, 50, 50);
   if (PlayerPos.y <= height - 65) {
     PlayerPos.y += playerSpeed;
     playerSpeed += playerAcc;
     
   //  waves();
   }
   
     
   fill(255,GreenShift, BlueShift);
   rect(0, height - 35, width, 35);
 }
   
   if(PlayerHealth < 0) {
     if (screen == 1) {
      endTime = millis() - startTime;
     }
       screen = 2;
   }
   
   if (screen == 2) {
     fill(255, 0, 0, 150);
     rect(0, 0, width, height);
     
     fill(255);
     textSize(40);
     text("Retry?", width/3, height/2);
     
     textSize(25);
     text("Your Time: " + (endTime/(1000) %60) + "seconds", width * 0.1, height * 0.1);
     
     textFade();
     fill(255, 255, 255, textAlpha);
     textSize(15);
     text("Hit Space To Try Again", width * 0.28, height * 0.75);
     
     if (keyPressed) {
       if (key == ' ') {
         setup();
       }
     }
   }
   
   if (screen == 0) {
     image(startScreen, 0, 0, width, height);
     textSize(40);
     textFade();
     fill(255, 255, 255, textAlpha);
     text("Hit Space", width/4, height - 170);
     
     if (keyPressed) {
       if (key == ' ') {
         start = false;
         setup();
       }
     }
   }
}
