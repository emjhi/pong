void gameover() {
  theme.pause();
  gameover.rewind();
  gameover.play();
  if (leftscore > rightscore) {
    background(lavendar);
    textFont(game);
    textSize(75);
    fill(150);
    text("LEFT WINS!!!", 400, 200);
  } else {
    background(blue);
    textFont(game);
    textSize(75);
    fill(150);
    text("RIGHT WINS!!!", 400, 200);
  }
}

void gameoverClicks() {
  reset();
  mode = INTRO;
}
