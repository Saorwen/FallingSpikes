class Spike
{
  PVector SpikePos;
  float accelaration;
  int score = 0;
  
  Spike() {
    SpikePos = new PVector(random(width), -10);
    accelaration = random(1, 2);
  }
  
  void update() {
    SpikePos.y += accelaration;
    if (SpikePos.y >= height + 20) {
      repeat();
      score++;
    }
  }
  
  void render() {
    pushMatrix();
    translate(SpikePos.x, SpikePos.y);
    triangle(0, 0, 5, 10, 5, 0);
    popMatrix();
  }
  
  void repeat() {
    SpikePos.x = random(width);
    SpikePos.y = -10;
    accelaration = random(1, 2);
  }
}
