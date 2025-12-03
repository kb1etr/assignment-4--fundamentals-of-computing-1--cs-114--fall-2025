void processKey(){  // reads key input and marks the game board position as filled

  invalidKey = 0;
  
  switch(key){
    
  case '0':
    X = 500/6;
    Y = 500/6;
    if (gameBoard[0] == NO_FILL){
      gameBoard[0] = O_FILL;
    }
    else {
      invalidKey = 1;
    }
    break;
    
  case '1':
    X = 3*500/6;
    Y = 500/6;
    if (gameBoard[1] == NO_FILL){
      gameBoard[1] = O_FILL;
    } 
    else { 
      invalidKey = 1;
    }
    break;
    
  case '2':
    X = 5*500/6;
    Y = 500/6;
    if (gameBoard[2] == NO_FILL){
      gameBoard[2] = O_FILL;
    }
    else {
      invalidKey = 1;
    }  
    break;
    
  case '3':
    X = 500/6;
    Y = 3*500/6;
    if (gameBoard[3] == NO_FILL){
      gameBoard[3] = O_FILL;
    }
    else {
      invalidKey = 1;
    }
    break;
    
  case '4':
    X = 3*500/6;
    Y = 3*500/6;
    if (gameBoard[4] == NO_FILL){
      gameBoard[4] = O_FILL;
    }
    else {
      invalidKey = 1;
    }  
    break; 
    
  case '5':
    X = 5*500/6;
    Y = 3*500/6;
    if (gameBoard[5] == NO_FILL){
      gameBoard[5] = O_FILL;
    }  
   else {
     invalidKey = 1;
   }
    break; 
    
  case '6':
    X = 500/6;
    Y = 5*500/6;
    if (gameBoard[6] == NO_FILL){
      gameBoard[6] = O_FILL;
    }  
    else {
      invalidKey = 1;
    }  
    break;
    
  case '7':
    X = 3*500/6;
    Y = 5*500/6;
    if (gameBoard[7] == NO_FILL){
      gameBoard[7] = O_FILL;
    } 
    else {
      invalidKey = 1;
    }  
    break;
    
  case '8':
    X = 5*500/6;
    Y = 5*500/6;
    if (gameBoard[8] == NO_FILL){
      gameBoard[8] = O_FILL;
    } 
    else {
      invalidKey = 1;
    }  
    break; 
    
  default:
     
    invalidKey = 1;
    break;
  }
  if (invalidKey == 1){ 
    index--;
    println("Invalid key pressed");  
  }
}

void placeCircle(){ 
   fill(255,0,0);
   noFill();
   ellipse(X, Y, circleDiameter, circleDiameter);
}    
   
void placeX(){  
  pickPosition();    // Only place an X in a box that is not filled
  drawX();
}

void pickPosition(){  // determines the next computer position by random number, then checks if it's empty
  
  for (int i=0; i<100; i++){
    square = (int)random (9);
    if (gameBoard[square] == NO_FILL){ 
      //println(square);
      
      switch(square){
        
        case 0:
          X = 500/6;
          Y = 500/6;
          gameBoard[0] = X_FILL;
          break;
          
        case 1:
          X = 3*500/6;
          Y = 500/6;
          gameBoard[1] = X_FILL;
          break;
          
        case 2:
          X = 5*500/6;
          Y = 500/6;
          gameBoard[2] = X_FILL;
          break;
          
        case 3:
          X = 500/6;
          Y = 3*500/6;
          gameBoard[3] = X_FILL;
          break;
          
        case 4:
          X = 3*500/6;
          Y = 3*500/6;
          gameBoard[4] = X_FILL;
          break; 
          
        case 5:
          X = 5*500/6;
          Y = 3*500/6;
          gameBoard[5] = X_FILL;
          break; 
        case 6:
        
          X = 500/6;
          Y = 5*500/6;
          gameBoard[6] = X_FILL;
          break;
          
        case 7:
          X = 3*500/6;
          Y = 5*500/6;
          gameBoard[7] = X_FILL;
          break;
          
        case 8:
          X = 5*500/6;
          Y = 5*500/6;
          gameBoard[8] = X_FILL;
          break; 
          
        default:
          break;
          
      } // end of case statement
      break;  // break out of for loop if an open cell is not found
    }  
    
    else {
   // println("Square is filled, square =  " + square); // test code print
    } 
  }
}

void test(){      // tests if there is a winner
  if (gameBoard[0] + gameBoard[1] + gameBoard[2] == 3) winner = COMPUTER;  // checking the rows
  else if (gameBoard[0] + gameBoard[1] + gameBoard[2] == 15) winner = YOU; 
  else if (gameBoard[3] + gameBoard[4] + gameBoard[5] == 3) winner = COMPUTER; 
  else if (gameBoard[3] + gameBoard[4] + gameBoard[5] == 15) winner = YOU;
  else if (gameBoard[6] + gameBoard[7] + gameBoard[8] == 3) winner = COMPUTER;
  else if (gameBoard[6] + gameBoard[7] + gameBoard[8] == 15) winner = YOU;
  
 else if (gameBoard[0] + gameBoard[3] + gameBoard[6] == 3) winner = COMPUTER;  // checking the columns
  else if (gameBoard[0] + gameBoard[3] + gameBoard[6] == 15) winner = YOU;
  else if (gameBoard[1] + gameBoard[4] + gameBoard[7] == 3) winner = COMPUTER;
  else if (gameBoard[1] + gameBoard[4] + gameBoard[7] == 15) winner = YOU;
  else if (gameBoard[2] + gameBoard[5] + gameBoard[8] == 3) winner = COMPUTER;  
  else if (gameBoard[2] + gameBoard[5] + gameBoard[8] == 15) winner = YOU;
  
  else if (gameBoard[0] + gameBoard[4] + gameBoard[8] == 3) winner = COMPUTER;  // checking the diagonals
  else if (gameBoard[0] + gameBoard[4] + gameBoard[8] == 15) winner = YOU;
  else if (gameBoard[2] + gameBoard[4] + gameBoard[6] == 3) winner = COMPUTER;
  else if (gameBoard[2] + gameBoard[4] + gameBoard[6] == 15) winner = YOU;
  
  if (winner == COMPUTER){
    println ("GAME OVER - COMPUTER WINS!");
    index = 5; // will prevent added entries
  }
  else if (winner == YOU){
    println ("GAME OVER - YOU WIN!");
    index = 5; // will prevent added entries
  }
}
    
