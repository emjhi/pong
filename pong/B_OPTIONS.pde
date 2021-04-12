void options() {
  theme.pause();
  background(dark);

  textFont(game);
  textSize(125);
  fill(blue);
  text("OPTIONS", 400, 100);

  fill(blue);
  tactile(100, 475, 150, 75);
  rect(100, 475, 150, 75);//back to intro

  tactile(600, 475, 150, 75);
  rect(600, 475, 150, 75);//back to game

  //text
  textFont(game);
  textSize(40);
  fill(purple);
  text("intro", 175, 510);
  text("game", 675, 510);
}


void optionClicks() {
  if (mouseX >= 100 && mouseX <= 250 && mouseY >= 475 && mouseY <= 550) {
    mode = INTRO;
    click.rewind();
    click.play();
  }
  if (mouseX >= 600 && mouseX <= 750 && mouseY >= 475 && mouseY <= 550) {
    mode = GAME;
    click.rewind();
    click.play();
    timer = 100;
  }
}
