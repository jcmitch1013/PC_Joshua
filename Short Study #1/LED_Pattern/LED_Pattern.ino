int BLUE = 9;
int RED = 7;
int YELLOW = 3;

const int button = 11;
int val = 0;
void setup() {
//Serial.begin(9600);
pinMode(BLUE,OUTPUT);
pinMode(RED,OUTPUT);
pinMode(YELLOW,OUTPUT);
pinMode(button, INPUT);

}


void loop() {
 
 val = digitalRead(button);
  Serial.println(val);
if(val == LOW){
digitalWrite(BLUE,HIGH);
delay(500);
digitalWrite(BLUE,LOW);
}
else{
  digitalWrite(BLUE,HIGH);
  delay(80);
digitalWrite(BLUE,LOW);
delay(80);
 digitalWrite(BLUE,HIGH);
  delay(80);
digitalWrite(BLUE,LOW);
delay(500);
   }
if(val == LOW){
digitalWrite(RED,HIGH);
delay(500);
digitalWrite(RED,LOW);
 }
else{ digitalWrite(RED,HIGH);
delay(80);
digitalWrite(RED,LOW);
delay(80);
digitalWrite(RED,HIGH);
delay(80);
digitalWrite(RED,LOW);
delay(500);
}

if(val == LOW){
digitalWrite(YELLOW,HIGH); 
delay(1000); 
digitalWrite(YELLOW,LOW);
}
else {
  digitalWrite(YELLOW,HIGH);
  delay(80);
   digitalWrite(YELLOW,LOW);
  delay(80);
    digitalWrite(YELLOW,HIGH);
  delay(80);
   digitalWrite(YELLOW,LOW);
  delay(500);
 }
}
 
