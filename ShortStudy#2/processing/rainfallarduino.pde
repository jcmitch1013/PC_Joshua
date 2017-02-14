import processing.serial.*;
import processing.sound.*;

Drop[] drops = new Drop[300];
SoundFile plop;
float val;

Serial myPort;

void setup(){
 
size(1000, 150);
//plop = new SoundFile(this,"drop2.mp3");
for (int i= 0; i < drops.length; i++){
drops[i] = new Drop();


}
println(Serial.list());

myPort = new Serial(this, Serial.list()[1], 9600);



}

void serialEvent(Serial myPort){
if ( myPort.available() > 0) { // If data is available,
val = myPort.read(); // read it and store it in val
}



}


void draw(){
background(100);


for (int i =0; i < drops.length; i++){
drops[i].show();
drops[i].fall();

if (drops[i].y > height){
  drops[i].x = random(width);
drops[i].y = -10;
}


println(val);




}

}