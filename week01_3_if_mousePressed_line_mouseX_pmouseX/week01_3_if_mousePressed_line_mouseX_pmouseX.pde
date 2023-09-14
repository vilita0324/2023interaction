//互動模式 Interactive Mode(Active Mode)
void setup(){
  size(500,500);
  background(255);//白色背景
}

void draw(){
  if(mousePressed){//mouse按下去才會畫圖
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
}

void keyPressed(){
  if(key=='1')stroke(255,0,0);//如果按下數字鍵1，筆觸變紅色
  if(key=='2')stroke(0,255,0);//如果按下數字鍵2，筆觸變綠色
  if(key=='3')stroke(0,0,255);//如果按下數字鍵3，筆觸變藍色
}
