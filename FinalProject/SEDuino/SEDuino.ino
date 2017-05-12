//Code by Joshua Mitchell 
/*Adapted from MPR121TEST Example for the MPR121 Breakout Written by Limor Fried/Ladyada for Adafruit Industries.  
BSD license*/

#include <Servo.h>

#include <Wire.h>
#include "Adafruit_MPR121.h"

// You can have up to 4 on one i2c bus but one is enough for testing!
Adafruit_MPR121 cap = Adafruit_MPR121();

// Keeps track of the last pins touched
// so we know when buttons are 'released'
uint16_t lasttouched = 0;
uint16_t currtouched = 0;

void setup() {
  Serial.begin(9600);
  
}

void loop() {
  // Get the currently touched pads
  currtouched = cap.touched();
  
  for (uint8_t i=0; i<12; i++) {
    // it if *is* touched and *wasnt* touched before, alert!
    if ((currtouched & _BV(i)) && !(lasttouched & _BV(i)) ) {
      Serial.print(i); 
    }
    if ((currtouched & _BV(1)) && !(lasttouched & _BV(1)) ) {
     
    }
  }

  // reset our state
  lasttouched = currtouched;

  
  // put a delay so it isn't overwhelming
  delay(100);
}
