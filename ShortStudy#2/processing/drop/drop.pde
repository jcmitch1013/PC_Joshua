class Drop {
float x= random(width);
float y= random(-40,0);
float yspeed=random(0.1,2);
float w =random(1,3);


void fall(){
y = y + yspeed;
if (yspeed < 10){
yspeed = yspeed + val/100;
}

}

void show(){
stroke(255);
stroke(255);
strokeWeight(w);
line(x,y,x,y+20);

}

void sound(){

}




}