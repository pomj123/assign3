//You should implement your assign3 here.
PImage fighterImg;
PImage enemyImg;
PImage bg1Img;
PImage bg2Img;
PImage hpImg;
PImage treasureImg;
PImage start1Img;
PImage start2Img;
PImage end1Img;
PImage end2Img;

float hp;
float treasureX;
float treasureY;
float bg2X;
float bg1X;
float enemyX;
float enemyY;
float fighterX;
float fighterY;
float enemyMove=random(-10,10);
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean hurt = false;
boolean eat = false;
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
int gameState;

void setup () {
  size(640, 480) ;
  //load img
    fighterImg=loadImage("img/fighter.png");
    enemyImg=loadImage("img/enemy.png");
    bg1Img=loadImage("img/bg1.png");
    bg2Img=loadImage("img/bg2.png");
    hpImg=loadImage("img/hp.png");
    treasureImg=loadImage("img/treasure.png");
    start1Img=loadImage("img/start1.png");
    start2Img=loadImage("img/start2.png");
    end1Img=loadImage("img/end1.png");
    end2Img=loadImage("img/end2.png");
  //StartInt
    gameState = GAME_START;
    fighterX=580;
    fighterY=220;
    hp=40;
    enemyY=floor(random(50,421));
    treasureX=floor(random(0,601));
    treasureY=floor(random(50,421));
}

void draw() {
  switch (gameState){
    
   case GAME_START :
    image(start2Img,0,0);
    if (mouseY>379 && mouseY<413){
      if(mouseX>207 && mouseX<444){
        if(mousePressed){
        gameState=GAME_RUN;
      }else{
        image(start1Img,0,0);}}}
    break;
    
  case GAME_RUN :  
    //BackGroundMoving
      image(bg1Img,bg1X % 1280 -640,0);
      image(bg2Img,(bg1X+640) % 1280 -640,0);
      bg1X += 1;
    
    //fighter
      image(fighterImg,fighterX,fighterY);
    
    //hp
      fill(#ff0000);
      stroke(#ff0000);
      rect(18,15,hp,15);
      image(hpImg,10,10);
      if(hp >= 200){hp=200;}
      
    //treasure
      image(treasureImg,treasureX,treasureY);
   
    //enemy
      image(enemyImg,enemyX%640,enemyY);
      enemyX=enemyX+3;
      if (enemyY<=fighterY){
      enemyY+=2;}
      if (enemyY>=fighterY){
      enemyY-=2;}
    
    //FighterMoving
      if (upPressed){
        fighterY -= 5;}
      if (downPressed){
        fighterY += 5;}
      if (leftPressed){
        fighterX -= 5;}
      if (rightPressed){
        fighterX += 5;}
      
    //Boundary
      if(fighterX > 580){
      fighterX=580;}
      if(fighterX < 10){
      fighterX=10;}
      if(fighterY > 420){
      fighterY=420;}
      if(fighterY < 10){
      fighterY=10;}
      
    //Hurt
      if ( fighterX-enemyX%640<50 && fighterX-enemyX%640>-50){
        if ( fighterY-enemyY<50 && fighterY-enemyY>-50){
          hp=hp-40;  
          enemyX=0;
          enemyY=floor(random(50,421));}}
    
    //Eat
      if ( fighterX-treasureX<40 && fighterX-treasureX>-40){
        if ( fighterY-treasureY<40 && fighterY-treasureY>-40){
          hp=hp+20;  
          treasureX=floor(random(50,421));
          treasureY=floor(random(50,421));}}
                  
    //GameOver
    if (hp <= 0){
    gameState=GAME_OVER;}
    break;
    
  case GAME_OVER :
    image(end2Img,0,0);
      if (mouseY>310 && mouseY<345){
        if(mouseX>210 && mouseX<425){
          if(mousePressed){
            //Restart
            fighterX=580;
            fighterY=220;
            hp=40;
            enemyY=floor(random(50,421));
            treasureX=floor(random(0,601));
            treasureY=floor(random(50,421));
            gameState=GAME_RUN;
        }else{
          image(end1Img,0,0);}}}
      break;
}}

void keyPressed() {
  if (key == CODED) {  
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }}}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }}}
