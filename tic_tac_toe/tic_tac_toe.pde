// Global variables
 int X; 
 int Y;
 int circleDiameter = 100;
 int size;
 int [] gameBoard = new int [9];
 int square;
 int index = 1;
 int winner = 0;
 int invalidKey = 0;

void setup() {

  size(500, 500);
  background(220);
  strokeWeight(8);
  X = width/2;
  Y = height/2;
  placeX();
}

void draw() {  
  if (keyPressed || index == 5){   // Check for key pressed or no one wins

         if (index >= 5){
       switch (winner){

         case 0:
           println("Game has ended - No one wins");
           break;

         case YOU:
           println("Game has ended - You Win !!");
           break;

         case COMPUTER:
           println("Game has ended - Computer Wins !!");
           break;

         default:
           break;
       }
     }
     else {
       println("Game is still in play . . .");
       processKey();
       if (invalidKey == 0){
         placeCircle();
       }
       test();  // test for a winner
       if ((winner == 0) && (invalidKey == 0)) placeX();  // prevents placement of final X
       test();
     }
     delay(500);
     index++; 
  }
}
