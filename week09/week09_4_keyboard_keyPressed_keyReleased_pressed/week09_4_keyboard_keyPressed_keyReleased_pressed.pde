PImage img;
int [][] pos={{92,491},{246,524},{176,525},{159,491},{151,455},{195,490},{229,489},{264,489},{322,456},{297,492},{330,489},{367,490},{313,523},{280,524},{356,456},{391,457},{84,456},{186,458},{127,491},{220,457},{286,457},{213,523},{117,457},{143,524},{254,454},{110,525}};
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
    if(pressed[i])rect(pos[i][0],pos[i][1],28,30,5);
  }
}
boolean [] pressed = new boolean[26];
void keyPressed(){
  if(key>='a' && key<='z') pressed[key-'a'] = true;
}
void keyReleased(){
  if(key>='a' && key<='z') pressed[key-'a'] = false;
}
void mousePressed(){
  println(mouseX,mouseY);//定位、印出mouse座標
}
