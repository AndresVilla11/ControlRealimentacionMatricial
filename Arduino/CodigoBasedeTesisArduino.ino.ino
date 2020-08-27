void setup() {
  // put your setup code here, to run once:

}

void loop() {# Codigo de Arduino

char s = ',';

if(Serial.available()){

String k = Serial.readString();

Pr = k.indexOf(s);

DC1 = k.substring(0,Pr).toInt();

k = k.substring(Pr+1);

Pr = k.indexOf(s);

DC2 = k.substring(0,Pr).toInt();

k = k.substring(Pr+1);

Pr = k.indexOf(s);

DC3 = k.substring(0,Pr).toInt();

k = k.substring(Pr+1);

Pr = k.indexOf(s);

DC4 = k.substring(0,Pr).toInt();

if((DC1>0))

analogWrite(9,(l1 = l1+0.15)*255/100);//LED 1

if((DC2>0))

analogWrite(10,(l2 = l2+0.15)*255/100);//LED 2

if((DC3>0))

analogWrite(5,(l3 = l3+0.15)*255/100);//LED 3

if((DC4>0))

analogWrite(3,(l4 = l4+0.15)*255/100);//LED 4

if((DC1<0))

analogWrite(9,(l1 = l1-0.15)*255/100);

if((DC2<0))

analogWrite(10,(l2 = l2-0.15)*255/100);

if((DC3<0))

analogWrite(5,(l3 = l3-0.15)*255/100);

if((DC4<0))

analogWrite(3,(l4 = l4-0.15)*255/100);

}
}
