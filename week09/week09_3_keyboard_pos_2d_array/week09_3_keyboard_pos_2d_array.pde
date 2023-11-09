PImage img;
int [][] pos={{96,488},{245,526},{171,521},{158,489},{149,450},{199,487},{229,489},{229,489},{264,489},{325,455},{299,485},{332,487},{362,486},
{310,520},{279,525},{352,456},{387,456},{78,453},{186,455},{123,488},{217,457},{287,455},{211,519},{118,454},{142,524},{254,453},{109,528}};
void setup(){
  size(800,600);
  img = loadImage("keyboard.png");
  rectMode(CENTER);//用中心點，來畫四邊形
}
void draw(){
  background(#FFFFF2);//淡黃色，清背景
  image(img,0,600-266);
  fill(255,0,0,128);//半透明紅色
  rect(mouseX,mouseY,28,30,5);
  fill(0,255,0,128);
  for(int i=0;i<26;i++){
    rect(pos[i][0],pos[i][1],28,30,5);
  }
}
void mousePressed(){
  println(mouseX,mouseY);//定位、印出mouse座標
}
