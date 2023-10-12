void setup(){
  size(400,400,P3D);//Processing 的3D功能
}
void draw(){
  background(#FFFFF2);
  pushMatrix();//備份矩陣
    translate(mouseX,mouseY);
    rotateY(radians(mouseX));//對Y軸作轉動
    fill(0,255,0);
    box(100);//3D的盒子、方塊
    
    noFill();//面不要填
    scale(2);//放大兩倍
    box(100);//雖是100的盒子，但上面有放大，所以就放大了
  popMatrix();//還原矩陣
}
