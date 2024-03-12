int gridSize = 50;
int numLanes = 5;
int screenWidth = gridSize * 10;
int screenHeight = gridSize * (numLanes + 2);
int frogX, frogY;
int frogSize = gridSize;
int[] carPositions;
int carWidth = gridSize * 2;
int carHeight = gridSize;
int carSpeed = 2;

void setup() {
  size(500, 350);
  frogX = width / 2 - frogSize;
  frogY = height - frogSize;
  carPositions = new int[numLanes];
  for (int i = 0; i < numLanes; i++) {
    carPositions[i] = int(random(width));
  }
}

void draw() {
  background(0);
  frog();
  cars();
  moveCars();
  intersects();
  
}


void frog(){
 fill(0, 255, 0);
 rect(frogX, frogY, frogSize, frogSize); 
}

void cars(){
  fill(255, 0, 0);
  for (int i = 0; i < numLanes; i++) {
    int y = (i + 1) * gridSize;
    rect(carPositions[i], y, carWidth, carHeight);
  }
}
  
  // Update car positions
void moveCars(){
  for (int i = 0; i < numLanes; i++) {
    carPositions[i] += carSpeed;
    if (carPositions[i] > width) {
      carPositions[i] = -carWidth;
    }
  }
}
  // Check for collisions
void intersects(){
  for (int i = 0; i < numLanes; i++) {
    int y = (i + 1) * gridSize;
    if (frogY == y && frogX < carPositions[i] + carWidth && frogX + frogSize > carPositions[i]) {
      // Reset frog position
      frogX = width / 2 - frogSize / 2;
      frogY = height - frogSize;
    }
  }
}


  void keyPressed() {
  if (keyCode == UP) {
    if (frogY - gridSize >= 0) {
      frogY -= gridSize;
    }
  } else if (keyCode == DOWN) {
    if (frogY + gridSize < height - frogSize) {
      frogY += gridSize;
    }
  } else if (keyCode == LEFT) {
    if (frogX - gridSize >= 0) {
      frogX -= gridSize;
    }
  } else if (keyCode == RIGHT) {
    if (frogX + gridSize < width - frogSize) {
      frogX += gridSize;
    }
  }
}




