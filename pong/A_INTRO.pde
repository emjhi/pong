void intro() {
  background(0);
  //screen
  noStroke();
  fill(dark);
  rect(150, 70, 500, 470);
  arcade.resize(800, 600);
  image(arcade, 0, 0);

  fill(blue);
  textFont(font);
  textSize(75);
  text("PONG", 400, 5);

  textSize(100);
  text("PONG!", 400, 150);

  tactile(250, 275, 300, 40);
  rect(250, 275, 300, 40);// 1 player
  tactile(250, 340, 300, 40);
  rect(250, 340, 300, 40);// 2 players
  textFont(game);
  textSize(25);
  fill(purple);
  text("1 PLAYER", 400, 290);
  text("2 PLAYERS", 400, 355);
}

void introClicks() {
  if (mouseX >= 250 && mouseX <= 550 && mouseY >= 275 && mouseY <= 320) {
    mode = GAME;
    click.rewind();
    click.play();
    AI = true;
  }
  if (mouseX >= 250 && mouseX <= 550 && mouseY >= 340 && mouseY <= 380) {
    mode = GAME; 
    click.rewind();
    click.play();
    AI = false;
  }
}

void tactile(int x, int y, int w, int h) {
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
    noStroke();
  } else {
    stroke(dark);
    strokeWeight(5);
  }
}
