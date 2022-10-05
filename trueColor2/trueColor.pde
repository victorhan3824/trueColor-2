import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//troocolor
/*
   ::::::..      ::::::  ::    ::  ::::::
 ::: :::::::     ::      ::    ::  ::
 :::       ::    ::::::  ::    ::  ::::::
 ::: :::::::         ::  ::.  .::      ::
 :::.....::      ::::::    ::::    ::::::
 :::.....::
 :::     ::
 */
//sound
Minim minim;
AudioPlayer song, fail, win;

//pallette
color wheat = #F0DAB3;
color woodD = #570604;
color woodL = #AF3230;
color wood  = #C13131;
color gold  = #F0BD66;
color sun   = #FFF812;
color black = #000000;
color white = #FFFFFF;

//the game colors
//color below appear in game
color red   = #F50202;
color orange= #FF5500;
color yellow= #F6FF03;
color green = #48DE61;
color blue  = #1521E8;
color purple= #7A15E8;
// -------------------------------------
//mode framework
int mode;
final int INTRO = 0;
final int GAME  = 1;
final int END   = 2;
final int HELP  = 3;

//aesthetics variables
PImage[] introGif;
PImage settingLogo;
PFont newYork;

//game variables (excluding color)
color[] gColors = {red, orange, yellow, green, blue, purple};
String[] gText  = {"RED", "ORANGE", "YELLOW"
  , "GREEN", "BLUE", "PURPLE"};
String textD;
color colorD, colorEnd;
boolean match; //match is whether the color/text match
int choice; // oui store what user pressed
//3 modes: 0 is undecided, 1 is oui, -1 is non
int count = 0;
int score = 0;
int highScore, maxCount;

//help page booleans
boolean b1, b2, b3; //representing your purchase status

//end of variables initalization--------
void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  //initalize mode
  mode = INTRO;

  //introGif initialization
  introGif = new PImage[91];
  for (int i=0; i < 91; i++) {
    introGif[i] = loadImage("introGif/frame_"+i+"_delay-0.03s.gif");
  }

  //initlaize the text you will display
  textD = gText[(int) random(0, 6)];
  colorD = gColors[(int) random(0, 6)];

  choice = 0;
  highScore = 0;
  colorEnd = white;
  maxCount = 90;

  //images and font initialization
  settingLogo = loadImage("logo1.png");
  newYork   = createFont("Newyork.otf", 30); //2nd var def text size

  //music intitalization
  minim = new Minim(this);
  song = minim.loadFile("MUSIC.mp3");
  fail = minim.loadFile("FAILURE.wav");
  win = minim.loadFile("SUCCESS.wav");
  
  //help page boolean 
  b1 = b2 = b3 = false;
}


void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == END) {
    end();
  } else if (mode == HELP) {
    help();
  }
}

void mouseClicked() {
  if (mode == INTRO) {
    introClick();
  } else if (mode == GAME) {
    gameClick();
  } else if (mode == END) {
    endClick();
  } else if (mode == HELP) {
    helpClick();
  }
}
