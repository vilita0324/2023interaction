//碰撞偵測:Mario vs. Pikachu
//牛頓力學(1)靜者恆靜、動者恆動(2)f = m*a 位置、速度、加速度
void setup(){
  size(400,400);
}
float marioX=50,marioY=250,vx=0,vy=0;
void draw(){
  background(108,137,255);
  marioX += vx;
  
  if(flying){//如果在飛行中
    marioY += vy;//上下位置會改變
    vy += 0.98;//重力加速度
    if(marioY >= 250){//碰到地板
      marioY = 250;//站在地面上
      flying = false;//不再飛行
    }
  }
  fill(255,0,0);ellipse(marioX,marioY,15,20);
  fill(229,119,42);rect(0,260,400,150);
  drawAndTestBox(100,150,20,20);
  drawAndTestBox(200,150,20,20);
  drawAndTestBox(300,150,20,20);
}
void drawAndTestBox(int x,int y,int w,int h){
  fill(229,119,42);rect(x,y,w,h);
  if(hitBox(x,y,w,h)){
    if(vy>0){
      marioY = y-10;
      flying = false;
      stand_box =true;
    }else{
      vy = 0;
      marioY = y+h+10;
    }
  }
  if(stand_box==true && flying==false && leaveBox(x,y,w,h)){
    stand_box = false;
    flying = true;
    vy = 0;
  }
}
boolean leaveBox(int x,int y,int w,int h){
  if(x-7>marioX || marioX > x+w+7) return true;
  else return false;
}
boolean hitBox(int x,int y, int w,int h){
  if(x-7<marioX && marioX < x+w+7 && y-10 < marioY && marioY < y+h+10) return true;
  else return false;
}
boolean flying = false, stand_box=false;
void keyPressed(){
  if(keyCode == RIGHT) vx = 2;
  if(keyCode == LEFT) vx = -2;
  if(keyCode == UP && flying == false){//如果沒有在飛 才能飛
    vy=-20;
    flying = true;//開始飛行
    stand_box= false;//現在有兩個變數 要處理
  }
}
void keyReleased(){
  if(keyCode==LEFT || keyCode==RIGHT) vx=0;
}
