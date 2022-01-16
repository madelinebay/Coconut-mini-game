Coconut[] coconuts = new Coconut[6];   //6 is the amount of coconuts, more coconuts makes game more difficult                    
Person p;
int timerInterval = 0;
int screen = 0;
int numSeconds = 0;
PImage coconut, palmleaves, palmbark, sand;  //declaring image variables 
     
//=======================================================================================================================

void setup() {
 size(700,500);
 frameRate(60);
 for(int i = 0; i < coconuts.length; i++) {
    coconuts[i] = new Coconut(30, 50, 5); //x position, y position, y speed
 }
    p = new Person(450, 325, 60, 150);  //x position, y position, person width, person height
    
 coconut = loadImage("coconutpic.png");
 palmleaves = loadImage("palmtreesfront.png");
 palmbark = loadImage("palmbark.png");
 sand = loadImage("sand1.png");
}

//========================================================================================================================

void draw() {
  background(131,211,247);
  
//=====FIRST=SCREEN=================================

  if (screen == 0) {
   fill(66,42,25);
   textSize(20);
   rect(100,120,500,200);
   fill(250);
   textAlign(CENTER);
   text("DO YOU KNOW COCONUTS ARE DEADLIER THAN SHARKS?", width/2, height/2-50);
   text("Click to Dodge the Coconuts", width/2, height/2);
  }
  
//========MAIN=GAME=SCREEN==========================

  else if (screen == 1) {
  image(palmbark,0,65);       //placing some images 
  image(sand,0,430);
  
  //TIMER
  timerInterval += 1;                           //count up by 1 every sub frame
  numSeconds = timerInterval / 60;              //Every 1 second, timer interval will count to 60
  println("Timer Interval =" +numSeconds);
  fill(0);
  textSize(30);
  text(numSeconds,40,475);
  
  //COCONUT FUNCTIONS
  for(int i=0; i < coconuts.length; i++) {      //creates separate coconuts c1, c2, c3...
  coconuts[i].display();                            
  coconuts[i].move();
  coconuts[i].coconutCollision(p.x, p.y, p.w, p.h); //passes the person variables 
  }

  //PERSON FUNCTIONS
  p.display();
  p.move();
  image(palmleaves,0,0);
}

//==========LAST=GAME=OVER=SCREEN==================

else if (screen == 2) {
  int finalTime = numSeconds;
  image(palmleaves,0,0);
  image(sand,0,430);
  textAlign(CENTER);
  textSize(60);
  fill(66,42,25);
  fill(250);
  text("GAME OVER", width/2, height/2-50);
  textSize(30);
  text("YOU SURVIVED:", 350,250);
  text(finalTime,290,300);
  text("seconds", 365, 300);
  image(coconut, 325, 325);
  image(coconut, 325 - 50, 325);
  image(coconut, 325 + 50, 325);
  text("CLICK TO PLAY AGAIN", width/2, 400);
}
} //closes draw function

//========================================================================================================================

//Function created in order to click through the screens 
void mouseClicked() {
  if (screen == 0) { //when you click you are brought to the game 
    screen = 1;
    resetMatrix();
  }
  else if (screen == 2) {  //when game is over and you click the screen it will reset you back to the main screen
  reset();                 //calls the function below to reset all values to how it was before game was played 
  resetMatrix();
  }
}
  
void reset() {
   screen = 0;
   timerInterval = 0;
   numSeconds = 0;
    for(int i = 0; i < coconuts.length; i++) {      //reset the coconuts x position to zero (and other values back to normal) so when you want to play again there isn't an immediate collision!!
    coconuts[i] = new Coconut(0, 50, 5);            //x position, y position, y speed
     }
}

//=======THE=END==========================================================================================================
