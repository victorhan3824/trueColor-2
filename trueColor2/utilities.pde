void cirButton(float x, float y, float r, color col, color bor) {
  //x, y, radius, button inside color, button border color
  fill(col);
  strokeWeight(3);
  
  //tactile
  if (dist(mouseX, mouseY, x, y) < r) stroke(white);
  else stroke(bor);
  
  circle(x,y,r*2); //draw button
}

boolean cirPressed(float x, float y, float r) {
  return(dist(mouseX, mouseY, x, y) < r);
}

void rectButton(float x, float y, float w, float h, color col, color bor) {
  //display rectangle buttons
  //x, y, button inside color, button border color
  fill(col);
  strokeWeight(3);
  
  //tactile
  float pX = x - w/2;
  float pY = y - h/2;
  if (mouseX > pX && mouseX < pX+w && mouseY > pY && mouseY < pY+h) stroke(white);
  else stroke(bor);
  
  rect(x,y,w,h); //draw button
}

boolean rectPressed(float x, float y, float w, float h) {
  float pX = x - w/2;
  float pY = y - h/2;
  
  return ( mouseX > pX && mouseX < pX+w && mouseY > pY 
  && mouseY < pY+h);
}
