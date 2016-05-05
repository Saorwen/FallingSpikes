class Spike
{
  PVector SpikePos;
  float initialVelocity;
  float accelaration = 0.15;
  
  Spike() {
    SpikePos = new PVector(random(width), -10);
    initialVelocity = random(1, 2);
  }
  
  void update() {
    SpikePos.y += initialVelocity;
    initialVelocity += accelaration;
    if (SpikePos.y >= height + 20) {
      repeat();
    }
  }
  
  void render() {
    pushMatrix();
    translate(SpikePos.x, SpikePos.y);
    triangle(0, 0, 15, 35, 30, 0);
    popMatrix();
  }
  
  void repeat() {
    SpikePos.x = random(width);
    SpikePos.y = -10;
    initialVelocity = random(1, 2);
  }

 void collide() {
    if (dist(PlayerPos.x, PlayerPos.y, SpikePos.x, SpikePos.y) < 30) {
         PlayerHealth --;
         GreenShift = (PlayerHealth * 2.5);
         BlueShift = (PlayerHealth * 2.5);
       }
   }
}
