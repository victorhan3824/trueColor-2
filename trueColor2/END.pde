//end screen

void end() {
  song.pause(); //stop background music
  fail.play();
  
  background(red);

  if (frameCount % 10 == 0) colorEnd = gColors[(int) random(1,6)];
  fill(colorEnd);
  textSize(128);
  text("GAMEOVER", width/2, 200);
  
  fill(white);
  textSize(24);
  text("Score :" + score, width/2, 300);
  if (max(score, highScore) == score) highScore = score;
  text("HighScore: " + max(score, highScore), width/2, 350);
  
  //click to continue
  textSize(endSize());
  text("Click to Continue", width/2, 500);
}

void endClick() {
  mode = INTRO;
  
  //reset things
  count = score = choice = 0;
  colorEnd = white;
  song.rewind();
  fail.rewind();
  fail.pause();
}

float endSize() {
  float x = radians(frameCount*6);
  return abs(10 * sin(0.5*x)) + 15;
}
