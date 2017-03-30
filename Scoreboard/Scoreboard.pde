import processing.serial.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import gifAnimation.*;

import processing.video.*;

Serial myPort;
Minim minim;
AudioPlayer sound;
AudioPlayer[] cash;
AudioPlayer horn;
Movie myFile;
//Fonts
PFont font;
PFont athletic;
PFont krunch;
int score = 0;
Gif boom;
float val;
//Timers
float stopTime;
int wait = 1500;
int timer = 30000;
int currentTime;
int savedTime = 0;
boolean shotMade;
String[] sayings = {"SHARPSHOOTER", "CASH!", "BANG!","YES!"};
int index;
int soundIndex;
boolean state= false;
boolean lastState = false;
int scoreIncrement = 10;
boolean bonus = false;


void setup(){
size(1000,1000);
minim = new Minim(this);
font = createFont("hemi head bd it.ttf", 288);
athletic = createFont("MutantAcademyBB.ttf", 100);
krunch = createFont("krunch.ttf", 150);
boom = new Gif(this, "blowup.gif");
boom.play();
sound = minim.loadFile("punk.mp3");
horn = minim.loadFile("airhorn.mp3");
cash = new AudioPlayer[4];
cash[0] = minim.loadFile("cash.mp3");
cash[1] = minim.loadFile("bang.mp3");
cash[2] = minim.loadFile("woo.mp3");
cash[3] = minim.loadFile("allday.mp3");

println(Serial.list());
String portName = Serial.list()[2];
myPort = new Serial(this, portName, 9600);

}

void draw(){
background(0);
translate(height/2,width/2);
imageMode(CENTER);
smooth();
textAlign(CENTER);
  //Serial read from Arduino 
  if (myPort.available() > 0) { 
    val = myPort.read(); 
    //println(val);
}

fill(255,0,0);


 

//timed shot graphics 
if (stopTime > millis()){
image(boom, 0,0);
textFont(athletic);

text(sayings[index], 0, 200);
}
//reset timer
currentTime = millis();


sound.play();

//BONUS ROUND!!
if (currentTime > 15000 && currentTime < 25000){
scoreIncrement = 50;
bonus = true;
}
if (bonus == true){
  textFont(krunch);
fill(random(255),random(255),random(255));
text("BONUS", 0,-300);
horn.play();
//horn.loop();
}
if (val==1){
shotMade = true;
}
else{
shotMade=false;
}


state = shotMade;
;
println(state);

// SCORE,SOUNDS,SAYINGS
soundIndex = int(random(cash.length));
//if val != lastVal
if (state != lastState){
if(state == true){
score=score+scoreIncrement;

 stopTime = millis() + wait;
 cash[soundIndex].play();
 cash[soundIndex].rewind();
index = int(random(sayings.length));
}

lastState = state;

}

textFont(font);

text(score, 0,0);

if(currentTime - savedTime > timer){
  score = 0;
  sound.pause();
  sound.rewind();
  savedTime = currentTime;
}

boom.noLoop ();


}