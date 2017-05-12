//Code by Joshua Carrington Mitchell with additions from Allison Berkoy
/* USER INSTRUCTIONS
   Connect world interface to Serial Port
   Select Region*/


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.serial.*;

Serial myPort;
Minim minim;
AudioPlayer[] sounds;

PImage zergon;
float val;
int circle=10;
boolean state= false;
boolean lastState = false;
boolean playing = false;
float jump;
int soundIndex;
int colors;

public void setup(){
size(1000,1000);
minim = new Minim(this);
zergon = loadImage("head.png");
sounds= new AudioPlayer[20];
// AUDIO TRACKS

//Australia
sounds[0] = minim.loadFile("data/Australia/ACDC.mp3");
sounds[1] = minim.loadFile("data/Australia/didgeridoo.mp3");
sounds[2] = minim.loadFile("data/Australia/malcolmfraserspeech.mp3");

//East Asia
sounds[3] = minim.loadFile("data/EastAsia/Cui Jian.mp3");
sounds[4] = minim.loadFile("data/EastAsia/YMO.mp3");

//Arabic Music
sounds [5] = minim.loadFile("data/ArabicWorld/KoKoKorina_Pakistan.mp3");
sounds [6] = minim.loadFile("data/ArabicWorld/Mexico.mp3");

//UK
sounds[7] = minim.loadFile("data/United Kingdom/bowie.mp3");
sounds[8] = minim.loadFile("data/United Kingdom/crass.mp3");
sounds[9] = minim.loadFile("data/United Kingdom/maxinenightengale.mp3");

  // West African Music
sounds [10] = minim.loadFile("data/WestAfrica/Beasts of No Nation.mp3");
sounds [11] = minim.loadFile("data/WestAfrica/Zibote.mp3");
sounds [12] = minim.loadFile("data/WestAfrica/Fela Kuti.mp3");

// USA! USA! USA!

sounds [13] = minim.loadFile("data/USA/Bold as Love.mp3");
sounds [14] = minim.loadFile("data/USA/What's Going On.mp3");
sounds [15] = minim.loadFile("data/USA/Nixon.mp3");

//South America
sounds [16] = minim.loadFile("data/South America/Os Mutantes.mp3");
sounds [17] = minim.loadFile("data/South America/Pueblo.mp3");

//East Africa

sounds [18] = minim.loadFile("data/East Africa/Queen.mp3");
sounds [19] = minim.loadFile("data/East Africa/VictoriaJazz.mp3");


//SERIAL 
println(Serial.list());
String portName = Serial.list()[1];
myPort = new Serial(this, portName, 9600);

}

public void draw(){
  
  background(colors);

translate(height/2,width/2);
smooth();

//Serial read from Arduino 
  if (myPort.available() > 0) { 
    val = myPort.read(); 
    //println(val);
}

imageMode(CENTER);

image(zergon, 0,0 + jump, 800, 1000);

//Serial audio trigger from Arduino
if (val==1){
  colors=255;
sounds[soundIndex].pause(); 
  sounds[soundIndex].rewind(); 
  soundIndex= int(random(3));
sounds[soundIndex].play(); 
jump = (random(-100,100));
val=0;
colors =0;
}

if (val == 2){
  colors =255;
  sounds[soundIndex].pause(); 
  sounds[soundIndex].rewind(); 
soundIndex= int(random(3,5));
sounds[soundIndex].play();
playing = true;
val=0;
colors =0;
}

if (val == 3){
  colors =255;
  sounds[soundIndex].pause(); 
  sounds[soundIndex].rewind(); 
 soundIndex= int(random(5,7));
 sounds[soundIndex].play();
 val=0;
colors =0;
}
if (val == 4){
  colors =255;
 sounds[soundIndex].pause(); 
  sounds[soundIndex].rewind(); 
 soundIndex= int(random(7,10));
 sounds[soundIndex].play();
 val=0;
colors =0;
}
if (val == 5){
  colors=255;
sounds[soundIndex].pause(); 
  sounds[soundIndex].rewind(); 
 soundIndex= int(random(10,13));
 sounds[soundIndex].play();
 val=0;
 colors =0;
}
if (val == 6){
sounds[soundIndex].pause(); 
  sounds[soundIndex].rewind(); 
 soundIndex= int(random(13,16));
 sounds[soundIndex].play();
 val=0;
}
if (val == 7){
sounds[soundIndex].pause(); 
  sounds[soundIndex].rewind(); 
 soundIndex= int(random(16,18));
 sounds[soundIndex].play();
 val=0;
}
if (val == 8){
sounds[soundIndex].pause(); 
  sounds[soundIndex].rewind(); 
 soundIndex= int(random(18,20));
 sounds[soundIndex].play();
 val=0;
}


//jump = 0;
fill(255);
//ellipse(0,0,circle,circle);






}