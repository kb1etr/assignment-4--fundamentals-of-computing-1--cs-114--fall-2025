void drawX(){              // Draws an 'X' on the game board
  line (X-450/6, Y-450/6, X+450/6, Y+450/6);
  line (X+450/6, Y-450/6, X-450/6, Y+450/6);
}
void drawGrid(){
  line(500/3, 0, 500/3, 500);
  line(500*2/3, 0, 500*2/3, 500);
  line(0, 500/3, 500, 500/3);
  line(0, 500*2/3, 500, 500*2/3);
}
