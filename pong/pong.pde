//Emma Sun
//1.4A
//april 6 2021

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//mode
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;
final int OPTIONS = 5;

//entities
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld; //ball
float ballvx, ballvy; //ball velocity
boolean AI; //AI
PImage arcade;
PFont font;
PFont game;


//keyboard 
boolean wkey, skey, upkey, downkey;

//scores
int leftscore, rightscore, timer;

//colours
color purple = #9666D9;
color lilac = #6727F2;
color lavendar = #4F26A6;
color dark = #151226;
color blue = #3552F2;

//sound variables
Minim minim;
AudioPlayer click, gameover, point, theme;


void setup () {
  size(800, 600);
  mode = INTRO;
  textAlign(CENTER, CENTER);

  //initialize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;

  rightx = 800;
  righty = height/2;
  rightd = 200;

  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 75; 
  ballvx = 2;
  ballvy = -2;

  //initialize keyboard
  wkey = skey = upkey = downkey = false;

  //initialize scores
  rightscore = leftscore = 0;
  timer = 100;

  arcade = loadImage("arcade.png");
  font = createFont("crackman.ttf", 50);
  game = createFont("game.ttf", 50);
  
  //minim
  minim = new Minim(this);
  click = minim.loadFile("click.wav");
  theme = minim.loadFile("theme.mp3");
  gameover = minim.loadFile("gameover.wav");
  point = minim.loadFile("point.wav");
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == OPTIONS) {
    options();
  } else {
    println("Mode error:" + mode);
  }
}

void reset() {
  leftscore = 0;
  rightscore = 0;

  lefty = height/2;
  righty = height/2;
  timer = 100;
  ballx = 400;
  bally = 300;
}
