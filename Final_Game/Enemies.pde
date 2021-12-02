// Class

class Enemies {

  // enemies var
  float enemyX;
  float enemyY;
  int enemyW;
  color enemyC;

  // player speed
  int playerSpeed;


  // hitboxes
  float topBound;
  float bottomBound;
  float rightBound;
  float leftBound;

  boolean isDead = false;


  int enemylife;
  
  PImage pic;

  // constructor function
  Enemies(float tempX, float tempY, int tempW, color tempC) {
    enemyX = tempX;
    enemyY = tempY;
    enemyW = tempW;
    enemyC = tempC;

    playerSpeed = 8;

    enemylife = 8;

    topBound = enemyY - enemyW/2;
    bottomBound = enemyY +enemyW/2;
    leftBound = enemyX - enemyW/2;
    rightBound = enemyX + enemyW/2;
    
    
    pic = loadImage("matt0.png");
    pic.resize(enemyW, enemyW+100);
  }


  // render player
  void render() {
    fill(enemyC);
    circle(enemyX, enemyY, enemyW);
    image(pic, enemyX, enemyY);
  }

  void isHit(Bullet aBullet) {
    if (aBullet.topBound > topBound) {
      if (aBullet.bottomBound < bottomBound) {
        if (aBullet.rightBound < rightBound) {
          if (aBullet. leftBound > leftBound) {
            aBullet.isDead = true;
            
            enemylife = enemylife - 1; 
          }
        }
      }
      
    }
    if (enemylife <= 0){
    isDead = true;
  }
  }
    
  


  // Following player
  void move(Player aPlayer) {
    topBound = enemyY - enemyW/2;
    bottomBound = enemyY +enemyW/2;
    leftBound = enemyX - enemyW/2;
    rightBound = enemyX + enemyW/2;

    if (aPlayer.playerY < enemyY) {
      enemyY = enemyY - playerSpeed;
    }
    if (aPlayer.playerX < enemyX) {
      enemyX = enemyX - playerSpeed;
    }

    if (aPlayer.playerY > enemyY) {
      enemyY = enemyY + playerSpeed;
    }
    if (aPlayer.playerX > enemyX) {
      enemyX = enemyX + playerSpeed;
    }
  }
}
