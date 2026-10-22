Animal[] colony = new Animal[50]; 
int foodX, foodY;
void setup() {
  size(600, 600); 
  for (int i = 0; i < colony.length; i++) {
    colony[i] = new Animal();
  }
  foodX = (int)(Math.random() * width);
  foodY = (int)(Math.random() * height);
}
void draw() {
  background(220); 
  fill(255, 0, 0); 
  ellipse(foodX, foodY, 12, 12);
  for (int i = 0; i < colony.length; i++) {
    colony[i].move(foodX, foodY);
    colony[i].show();
    if (colony[i].isEating(foodX, foodY)) {
      foodX = (int)(Math.random() * width);
      foodY = (int)(Math.random() * height);
    }
  }
}
class Animal {
  int x;
  int y;
  int animalColor;
  int size;
Animal() {
    x = (int)(Math.random() * width);
    y = (int)(Math.random() * height);
    size = (int)(Math.random() * 10) + 15; 
    animalColor = color((int)(Math.random() * 60) + 100, 69, 19); 
  }
  void move(int foodX, int foodY) {
    int stepX = (int)(Math.random() * 3) - 1;
    int stepY = (int)(Math.random() * 3) - 1;
    if (foodX > x && Math.random() < 0.65) { x += 1; }
    else if (foodX < x && Math.random() < 0.65) { x -= 1; }
    if (foodY > y && Math.random() < 0.65) { y += 1; }
    else if (foodY < y && Math.random() < 0.65) { y -= 1; }
    x += stepX;
    y += stepY;
  }
  boolean isEating(int foodX, int foodY) {
    double distance = dist(x, y, foodX, foodY);
    return distance < (size / 2 + 6); 
  }
  void show() {
    fill(animalColor);
    noStroke();
    ellipse(x, y, size, size);
    fill(0);
    ellipse(x - 4, y - 2, 3, 3);
    ellipse(x + 4, y - 2, 3, 3);
  }
}
