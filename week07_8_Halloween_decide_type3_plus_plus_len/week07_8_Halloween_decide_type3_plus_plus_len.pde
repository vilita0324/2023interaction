ArrayList<PVector>pt = new ArrayList<PVector>();
void setup(){
  size(400,400);
  background(255);
}
float ghostX = 400,ghostY = 20;
void mouseDragged(){//按下mouse鍵，再拖它
  pt.add(new PVector(mouseX,mouseY));
}
void draw(){
  background(255);
  strokeWeight(1);
  stroke(0);ellipse(200,200,15,15);
  stroke(0);ellipse(ghostX,ghostY,15,15);
  //if(mousePressed)line(mouseX,mouseY,pmouseX,pmouseY);
  strokeWeight(4);//線條變粗
  float dpx=0,dpy=0;//要看p.x和p2.x的差距 p.y和p2.y的差距
  float rightdown = 0;//往右下
  for(int i=0;i<pt.size()-1;i++){
    PVector p = pt.get(i),p2 = pt.get(i+1);
    dpx += abs(p2.x - p.x);//累積x的移動量
    dpy += abs(p2.y - p.y);//累積y的移動量
    if(p2.x-p.x > 0 && p2.y-p.y > 0)rightdown+=sqrt(dpx*dpx+dpy*dpy);
    ellipse(p.x,p.y,10,10);
  }
  if(dpx>100 && dpy<40) stroke(255,0,0);//type1紅色的橫線
  else if(dpx<40 && dpy>100) stroke(0,0,255);//type2藍色的直線
  else if(rightdown>150) stroke(0,255,0);///type3的前半段，往右下
  else stroke(0);//不是，就黑色
  for(int i=0;i<pt.size()-1;i++){
    PVector p = pt.get(i),p2 = pt.get(i+1);
    line(p.x,p.y,p2.x,p2.y);
  }
  float dx = 200-ghostX,dy = 200-ghostY,len = sqrt(dx*dx+dy*dy);
  ghostX += dx/len/3;
  ghostY += dy/len/3;
  
}
void mouseReleased(){
  //background(255);
  for(int i=pt.size()-1;i>=0;i--){//倒過來的for迴圈
    pt.remove(i);
  }
}
