class Coconut {
  //define local variables (to this object)
  float x;
  float y;
  float ySpeed;
  float w;
  float h;
    
  Coconut(float _x, float _y, float _ySpeed) {
    //assign a passed value (parameter) to your local object's scope
    x = _x;
    y = _y;
    ySpeed = _ySpeed;
    w = 30;
    h = 30;
  }
  
  //=================================================================================
  //After attributes/variables are declared, the behaviors/functions come next 
  
  void display() {
    image(coconut,x,y);
    //ellipse(xpos,ypos,30,30);                                    //x,y,diameter,diameter
    //}
  }
   
  //==============================================================================
  
void move() {
    y = y + ySpeed;
    if (y > width) {  //if y position is greater than height (out of frame) reset to a random number
      x = random(0,700);  
      y = random(-100,50); 
    }
    if (numSeconds > 10) { //if 10 seconds pass, increase the speed to 7(the speed started at 5)
      ySpeed = 6;
    }
    if (numSeconds > 15) {
      ySpeed = 6.5;
    }
    if(numSeconds > 20) {
      ySpeed = 7;
    }
    if(numSeconds > 25) {
      ySpeed = 7.5;
    }
    if(numSeconds > 30) {
      ySpeed = 8;
    }
    if(numSeconds > 35) {
      ySpeed = 9;
    }
    if(numSeconds > 40) {
      ySpeed = 10;
    }
}
  
//==============================================================================
  
void coconutCollision(int _pX, float _pY, float _pW, float _pH) {  //if there is an underscore (_) that means that variable is being passed. In this example all these variables are being passed from the person
    if((x + w >= _pX) && (x <= _pX + _pW) &&           //example: if the right side of the coconut is >= the left side of the person(coconut touches person).....then the game is over 
      (y + h >= _pY) && (y <= _pY + _pH)) {
      screen = 2;
    } 
  }
  
} //Closes class 
//=======THE=END==========================================================================================================
