// Class
class Player {

  // player vars

  int playerX;
  int playerY;
  int playerW;
  color playerC;

  boolean player1;

  boolean isUp;
  boolean isDown;
  boolean isLeft;
  boolean isRight;

  // hitboxes
  int topBound;
  int bottomBound;
  int rightBound;
  int leftBound;

  // player speed
  int playerSpeed;


  int lives;

  // constructor function
  Player(int tempX, int tempY, int tempW, color tempC) {
    playerX = tempX;
    playerY = tempY;
    playerW = tempW;
    playerC = tempC;

    playerSpeed = 12;


    topBound = playerY - playerW/2;
    bottomBound = playerY + playerW/2;
    leftBound = playerX - playerW/2;
    rightBound = playerX + playerW/2;

    lives = 70;
  }


  // render player
  void render() {
    fill(playerC);
    circle(playerX, playerY, playerW);
  }


  // player movement
  void move() {
    topBound = playerY - playerW/2;
    bottomBound = playerY + playerW/2;
    leftBound = playerX - playerW/2;
    rightBound = playerX + playerW/2;

    if (isUp == true && playerY - playerW/2 >= 0) {
      playerY = playerY - playerSpeed;
    }
    if (isDown == true && playerY + playerW/2 <= height) {
      playerY = playerY + playerSpeed;
    }
    if (isLeft == true && playerX - playerW/2 >= 0) {
      playerX = playerX - playerSpeed;
    }
    if (isRight == true && playerX + playerW/2 <= width) {
      playerX = playerX + playerSpeed;
    }
  }


  void collision(Enemies aEnemy) {
    if (leftBound  <  aEnemy.rightBound) {
      if (rightBound > aEnemy.leftBound) {
        if (topBound < aEnemy.bottomBound) {
          if (bottomBound > aEnemy.topBound) {

            lives = lives - (1);
           
          }
        }
      }
    }
    if (lives <= 0){
      state = 3;
  }
}

  void collision(Boss theBoss) {
    if (leftBound  <  theBoss.rightBound) {
      if (rightBound > theBoss.leftBound) {
        if (topBound < theBoss.bottomBound) {
          if (bottomBound > theBoss.topBound) {

            lives = lives - (1);
           
          }
        }
      }
    }
    if (lives <= 0){
      state = 5;
  }
}
}
