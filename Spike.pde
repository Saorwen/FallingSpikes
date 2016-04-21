class Spike
{
  PVector SpikePos;
  float initialVelocity;
  float accelaration = 0.2;
  int score = 0;
  
  Spike() {
    SpikePos = new PVector(random(width), -10);
    initialVelocity = random(1, 2);
  }
  
  void update() {
    SpikePos.y += initialVelocity;
    initialVelocity += accelaration;
    if (SpikePos.y >= height + 20) {
      repeat();
      score++;
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
}
