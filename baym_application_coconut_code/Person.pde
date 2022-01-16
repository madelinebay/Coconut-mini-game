class Person {
  int x;
  float y;
  float w;
  float h;
  PImage person;
  
  Person(int _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    person = loadImage("person1.png");
  }
  
//========================================================================================

void display() {
  noStroke();
  fill(227,109,225);
  image(person,x,y); //image(person, float, float)
}

//------------------------------------------------------
   
void move(){
  x = mouseX;
}

} //Closes class 
//========THE=END=========================================================================
