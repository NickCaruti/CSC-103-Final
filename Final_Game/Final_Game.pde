import processing.sound.*;

// animations
Animation doodAnimation;
PImage[] doodImages = new PImage[3];



// Classes
Player player;
Enemies enemies;
Bullet bullet;
Boss boss;

// declaring sound var
SoundFile pewSound;
SoundFile backgroundMusic;

ArrayList<Bullet> bulletList;

ArrayList<Enemies> enemyList;


int state;

PImage city;



void setup() {
  size(800, 800);
  pewSound = new SoundFile(this, "pew.wav");
  backgroundMusic = new SoundFile(this, "van.mp3");


  for (int i = 0; i<doodImages.length; i++) {
    doodImages[i] = loadImage("dood" +i+ ".png");
  }

  doodAnimation = new Animation(doodImages, 0.1, 3.0);



  player = new Player (50, height/2, 50, color(255));
  
  boss = new Boss (500, 600, 50, color(#F70C0C));

  enemies = new Enemies (500, 600, 50, color(#F70C0C));
  Enemies e1 = new Enemies (300, 500, 50, color(#F70C0C));
  Enemies e2 = new Enemies (600, 400, 50, color(#F70C0C));
  Enemies e3 = new Enemies (700, 100, 50, color(#F70C0C));
  Enemies e4 = new Enemies (400, 200, 50, color(#F70C0C));


  bulletList = new ArrayList<Bullet>();

  enemyList = new ArrayList<Enemies>();
  if (enemyList.size() <= 4) {
    enemyList.add(e1);
    enemyList.add(e2);
    enemyList.add(e3);
    enemyList.add(e4);
    enemyList.add((enemies));
  }
}

void draw() {
  //background(loadImage("city.jpeg"));
  
  switch(state) {
  case 0:
    background (loadImage("start.png"));
    textSize(30);
    fill(255, 0, 0);
    text("Press 'r' To Start", 250, 350);
    textSize(20);
        text("Press Arrow Keys To Move", 250, 450);
    text("Press 'wasd' To Shoot", 275, 500);

if(backgroundMusic.isPlaying() == false){
    backgroundMusic.play();
    }
    break;

  
    
  case 1:
    background (loadImage("room1.jpeg"));
    textSize(35);
    text("Press 'q' to move next room ", 50, 50);

    //player.render();
    player.move();
    doodAnimation.display(player.playerX, player.playerY);

    for (Enemies anEnemy : enemyList) {
      if (!anEnemy.isDead) {
        anEnemy.render();
        anEnemy.move(player);
        player.collision(anEnemy);
        for (Bullet aBullet : bulletList) {
          anEnemy.isHit(aBullet);
        }
      }
    }

    for (Bullet aBullet : bulletList) {
      aBullet.render();
      aBullet.move();
    }

    for (int i = enemyList.size()-1; i>=0; i--) {
      if (enemyList.get(i).isDead == true) {
        enemyList.remove(i);

      }
    }

    for (int i = bulletList.size()-1; i>=0; i--) {
      if (bulletList.get(i).isDead == true) {
        bulletList.remove(i);

      }
    }

    break;

  case 2:
    background (loadImage("street.jpeg"));
        textSize(35);
    text("Press 'e' to move next room ", 50, 50);

    //player.render();
    player.move();
    doodAnimation.display(player.playerX, player.playerY);

    for (Enemies anEnemy : enemyList) {
      if (!anEnemy.isDead) {
        anEnemy.render();
        anEnemy.move(player);
        player.collision(anEnemy);
        for (Bullet aBullet : bulletList) {
          anEnemy.isHit(aBullet);
        }
      }
    }

    for (Bullet aBullet : bulletList) {
      aBullet.render();
      aBullet.move();
      //aBullet.isHit(anEnemy);
    }

    for (int i = enemyList.size()-1; i>=0; i--) {
      if (enemyList.get(i).isDead == true) {
        enemyList.remove(i);
      }
    }
    for (int i = bulletList.size()-1; i>=0; i--) {
      if (bulletList.get(i).isDead == true) {
        bulletList.remove(i);

      }
    }

    break;

  case 3:
    background (loadImage("room3.jpeg"));
        textSize(35);
    text("Press 'z' to move next room ", 50, 50);
    //player.render();
    player.move();
    doodAnimation.display(player.playerX, player.playerY);

    for (Enemies anEnemy : enemyList) {
      if (!anEnemy.isDead) {
        anEnemy.render();
        anEnemy.move(player);
        player.collision(anEnemy);
        for (Bullet aBullet : bulletList) {
          anEnemy.isHit(aBullet);
        }
      }
    }

    for (Bullet aBullet : bulletList) {
      aBullet.render();
      aBullet.move();
    }

    for (int i = enemyList.size()-1; i>=0; i--) {
      if (enemyList.get(i).isDead == true) {
        enemyList.remove(i);
      }
    }
    for (int i = bulletList.size()-1; i>=0; i--) {
      if (bulletList.get(i).isDead == true) {
        bulletList.remove(i);

      }
    }
    break;

  case 4:
    background (loadImage("temple.jpeg"));
    //player.render();
    player.move();
    doodAnimation.display(player.playerX, player.playerY);

    if (!boss.isDead) {
      boss.render();
      boss.move(player);
      player.collision(boss);

      for (Bullet aBullet : bulletList) {
        boss.isHit(aBullet);
      }
    }
    for (Bullet aBullet : bulletList) {
      aBullet.render();
      aBullet.move();
      //aBullet.isHit(anEnemy);
    }

    break;

  case 5:

    for (Enemies anEnemy : enemyList) {
      if (!anEnemy.isDead) {
        anEnemy.render();
        anEnemy.move(player);
        player.collision(anEnemy);
      }
    }

    background(42);
    textSize(100);
    text("You Died :(", 200, 300);
    textSize(100);
    text("Press 'r' To Restart", 0, 600);
    break;
    
    case 6:
      
      background(42);
    textSize(100);
    text("You WIN!!!!!!!! :)", 200, 300);
    textSize(100);
    text("Press 'r' To Restart", 0, 600);
    
    break;
  }
}



void keyPressed() {


  if (key=='r') {
    setup();
    state = 1;
  }
  if (key == 'q') {
    setup();
    state = 2;
  }
  if (key == 'e') {
    setup();
    state = 3;
  }
  if (key == 'z') {
    setup();
    state = 4;
  }


  if (key == 'w') {
    bulletList.add(new Bullet(player.playerX, player.playerY, 10, color(255), true, false, false, false));
    pewSound.play();
  }

  if (key == 'a') {
    bulletList.add(new Bullet(player.playerX, player.playerY, 10, color(255), false, false, false, true));
    pewSound.play();
  }

  if (key == 's') {
    bulletList.add(new Bullet(player.playerX, player.playerY, 10, color(255), false, true, false, false));
    pewSound.play();
  }

  if (key == 'd') {
    bulletList.add(new Bullet(player.playerX, player.playerY, 10, color(255), false, false, true, false));
    pewSound.play();
  }

  if (key == CODED) {
    if (keyCode == UP) {
      player.isUp = true;
      doodAnimation.isAnimating = true;
    }
  }

  if (key == CODED) {
    if (keyCode == DOWN) {
      player.isDown = true;
      doodAnimation.isAnimating = true;
    }
  }

  if (key == CODED) {
    if (keyCode == RIGHT) {
      player.isRight = true;
      doodAnimation.isAnimating = true;
    }
  }

  if (key == CODED) {
    if (keyCode == LEFT) {
      player.isLeft = true;
      doodAnimation.isAnimating = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      player.isUp = false;
    }
    if (keyCode == DOWN) {
      player.isDown = false;
    }
    if (keyCode == RIGHT) {
      player.isRight = false;
    }
    if (keyCode == LEFT) {
      player.isLeft = false;
    }
  }
}
