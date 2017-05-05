int speed = 5;
int spawnchance = 50;
Survivor player = new Survivor(this);
ArrayList<Zombie> zombies = new ArrayList<Zombie>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

void setup() {
  size(800, 600);
}

void draw() {
  background(0);
  if ( (Math.random() * spawnchance) < 1) {
    zombies.add( new Zombie(this) );
    //println(zombies.size());
  }
  for (Zombie z : zombies) {
    z.update(player);
    z.draw();
  }
  for (Bullet b : bullets) {
    b.update();
    b.draw();
  }
  player.draw();
  player.update();
}
void keyPressed() {
  if (keyCode == player.UP) {
    player.setYSpeed(-speed);
  } else if (keyCode == player.DOWN) {
    player.setYSpeed(speed);
  } else if (keyCode == player.LEFT) {
    player.setXSpeed(-speed);
  } else if (keyCode == player.RIGHT) {
    player.setXSpeed(speed);
  }
}  

void keyReleased() {
  if (keyCode == player.UP || keyCode == player.DOWN) {
    player.setYSpeed(0);
  } else if (keyCode == player.LEFT || keyCode == player.RIGHT) {
    player.setXSpeed(0);
  }
}

void mousePressed() {
  bullets.add(new Bullet(this, player));
}