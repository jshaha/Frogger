int gridSize = 50;
int numLanes = 3;
int numRivers = 2;
int numTargets = 5;
int screenWidth = gridSize * 10;
int screenHeight = gridSize * (numLanes + numRivers + 4); // Extra for safe zones, water, and targets
boolean[] targetsReached;
Frog frog;
ArrayList<Car> cars;
ArrayList<Log> logs;

void setup() {
  size(500, 450);
  frog = new Frog(width / 2 - gridSize / 2, height - gridSize, gridSize);
  cars = new ArrayList<Car>();
  logs = new ArrayList<Log>();
  targetsReached = new boolean[numTargets];

  // Initialize cars with spacing to prevent overlap
  for (int i = 0; i < numLanes; i++) {
    int laneY = (i + numRivers + 2) * gridSize;
    int spacing = width / (int(random(2, 5))); // Random spacing between 2 to 4 cars per lane
    for (int x = 0; x < width; x += spacing) {
      cars.add(new Car(x, laneY, int(random(1, 4)), gridSize));
    }
  }

  // Initialize logs
  for (int i = 0; i < numRivers; i++) {
    int riverY = (i + 1) * gridSize;
    int spacing = width / (int(random(3, 6))); // Random spacing between 3 to 5 logs per river
    for (int x = 0; x < width; x += spacing) {
      logs.add(new Log(x, riverY, int(random(1, 3)), gridSize));
    }
  }
}

void draw() {
  background(0);
  drawTargets();
  drawWater();
  drawRoad();

  for (Log log : logs) {
    log.show();
    log.update();
  }

  for (Car car : cars) {
    car.show();
    car.update();
  }

  frog.show();
  frog.update(logs, cars, targetsReached);
}

void drawRoad() {
  fill(50);
  rect(0, (numRivers + 2) * gridSize, width, numLanes * gridSize);
}

void drawWater() {
  fill(0, 0, 255);
  rect(0, gridSize, width, numRivers * gridSize);
}

void drawTargets() {
  for (int i = 0; i < numTargets; i++) {
    if (!targetsReached[i]) {
      fill(255, 255, 0);
      rect(i * 2 * gridSize + gridSize / 2, 0, gridSize, gridSize);
    } else {
      fill(0, 255, 0);
      rect(i * 2 * gridSize + gridSize / 2, 0, gridSize, gridSize);
    }
  }
}

void keyPressed() {
  frog.move(keyCode);
}

