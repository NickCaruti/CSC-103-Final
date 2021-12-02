// Class

class Boss{
  
  
   // enemies var
  int BossX;
  int BossY;
  int BossW;
  color BossC;

  // player speed
  int BossSpeed;


  // hitboxes
  int topBound;
  int bottomBound;
  int rightBound;
  int leftBound;
  
  
    boolean isDead = false;

  
    PImage pic;
    
      int bosslife;
      
      


  
  // contructor
  
  Boss(int tempX, int tempY, int tempW, color tempC) {
    BossX = tempX;
    BossY = tempY;
    BossW = tempW;
    BossC = tempC;
    
    
    BossSpeed = 7;
    
    
    bosslife = 100;
    
    
    topBound = BossY - BossW/2;
    bottomBound = BossY +BossW/2;
    leftBound = BossX - BossW/2;
    rightBound = BossX + BossW/2;
    
    pic = loadImage("DY.png");
    pic.resize(BossW + 400, BossW + 400);
  }
  
  // render Boss
  void render() {
    fill(BossC);
    //circle(BossX, BossY, BossW);
    image(pic, BossX, BossY);
  }
  
  void isHit(Bullet aBullet) {
    if (aBullet.topBound > topBound) {
      if (aBullet.bottomBound < bottomBound) {
        if (aBullet.rightBound < rightBound) {
          if (aBullet. leftBound > leftBound) {
            
             bosslife = bosslife - 1; 
          }
        }
      }
    }
    if (bosslife <= 0){
    isDead = true;
    state = 6;
    }
  }
  
  
  // Following player
  void move(Player aPlayer) {
    topBound = BossY - BossW/2;
    bottomBound = BossY +BossW/2;
    leftBound = BossX - BossW/2;
    rightBound = BossX + BossW/2;

    if (aPlayer.playerY < BossY) {
      BossY = BossY - BossSpeed;
    }
    if (aPlayer.playerX < BossX) {
      BossX = BossX - BossSpeed;
    }

    if (aPlayer.playerY > BossY) {
      BossY = BossY + BossSpeed;
    }
    if (aPlayer.playerX > BossX) {
      BossX = BossX + BossSpeed;
    }
  }
  
 
}
