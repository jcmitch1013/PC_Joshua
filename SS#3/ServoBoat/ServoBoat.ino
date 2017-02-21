#include <Servo.h>

Servo myServo;
int knockSensor = 0;
int THRESHOLD = 300;


void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
myServo.attach(9);

}

void loop() {
  // put your main code here, to run repeatedly:
int val = analogRead(A0);
//val = map(val,0,1024,0,180);
 if (val >= THRESHOLD) {
val = random(0,180);
    Serial.println("Knock!");

 }
 myServo.write(val);
 }



//delay(1000);

