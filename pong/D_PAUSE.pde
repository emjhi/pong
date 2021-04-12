void pause() {
   theme.pause();
  textFont(game);
  textSize(150);
  fill(blue);
  text("PAUSED", 405, 250);
}

void pauseClicks() {
  if (mouseX >= 355 && mouseX <= 385 && mouseY >= 15 && mouseY <= 45) {
    mode = GAME;
    click.rewind();
    click.play();
  }
}
