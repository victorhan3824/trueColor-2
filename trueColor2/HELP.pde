
void help() {
  background(black);  
  helpButton();
  
  rectButton(width/2, 100, 300, 100, gold, black); //maxCount --> 120
  rectButton(width/2, 300, 300, 100, gold, black); //maxCount --> 180
  rectButton(width/2, 500, 300, 100, gold, black); //music --> On
  
  fill(white);
  textSize(20);
  if (!b1) text("Speed Decrease Lv1: $5.99", width/2, 100); 
  else text("Bought", width/2, 100);

  if (!b2) text("Speed Decrease Lv2: $9.99", width/2, 300); 
  else text("Bought", width/2, 300);
  
  if (!b3) text("Music: $10.99", width/2, 500); 
  else text("Bought", width/2, 500);
  
}

void helpClick() {
  if (cirPressed(50,50,30)) mode = INTRO;
  
  if (rectPressed(width/2, 100, 300, 100)) b1 = true;
  if (rectPressed(width/2, 300, 300, 100)) b2 = true;
  if (rectPressed(width/2, 500, 300, 100)) b3 = true;
}
