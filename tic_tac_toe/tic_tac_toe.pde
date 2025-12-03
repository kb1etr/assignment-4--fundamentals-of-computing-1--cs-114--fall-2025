// Global variables
 int X; 
 int Y;
 int circleDiameter = 450/3;
 int size;
 int [] gameBoard = new int [9];
 int square;
 int index = 1;
 int winner = 0;
 int invalidKey = 0;

void setup() {

  size(500, 500);
  background(220);
  pixelDensity(2);
  X = width/2;
  Y = height/2;
  strokeWeight(1);  // 1 pixel stroke width for grid
  drawGrid();
  strokeWeight(4);  // 4 pixel width for shapes
  placeX();
  println("Press keys 0-8 only");
}

void draw() {  
  if (keyPressed || index == 5){   // Check for key pressed or for 'no one wins'

         if (index >= 5){
       switch (winner){

         case 0:
           println("Game has ended - No one won");
           break;

         case YOU:
           println("Game has ended - User Won !!");
           break;

         case COMPUTER:
           println("Game has ended - Computer Won !!");
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
