void game() {
  theme.play();
  background(dark);
  stroke(purple);
  strokeWeight(6);
  line(400, 0, 400, 600);

  //scoreboard
  textSize(50);
  fill(lavendar);
  text(leftscore, 150, 100);
  fill(blue);
  text(rightscore, 650, 100);
  //timer
  //text(timer, 650, 500);
  timer = timer - 1;

  //paddles
  fill(lavendar);
  circle(leftx, lefty, leftd);
  fill(blue);
  circle(rightx, righty, rightd);

  //ball
  noStroke();
  fill(lilac);
  circle(ballx, bally, balld);

  //move paddles
  if (wkey == true) lefty = lefty - 7;
  if (skey == true) lefty = lefty + 7;

  if (AI == false) {
    if (upkey == true) righty = righty - 7;
    if (downkey == true) righty = righty + 7;
  } else {
    if (bally > righty) {
      righty = righty + 4;
    }
    if (bally < righty) {
      righty = righty - 4;
    }
  }

  if (lefty >= 500) {
    lefty = 500;
  }
  if (lefty <= 100) {
    lefty = 100;
  }
  if (righty >= 500) {
    righty = 500;
  }
  if (righty <= 100) {
    righty = 100;
  }


  //move ball
  if (timer < 0) {
    ballx = ballx + ballvx;
    bally = bally + ballvy;
  }
  if (bally >= 563) {
    bally = 563;
  }
  if (bally <= 37) {
    bally = 37;
  }

  //scoring
  if (ballx <= 0) {
    rightscore++; 
    ballx = width/2;
    bally = height/2;
    timer = 100;
    point.rewind();
    point.play();
  }

  if (ballx >= 800) {
    leftscore++; 
    ballx = width/2;
    bally = height/2;
    timer = 100;
    point.rewind();
    point.play();
  }

  //cirlce bouncing
  if (bally <= balld/2 || bally >= height - balld/2) {
    ballvy = ballvy * -1;
  }
  if (dist(leftx, lefty, ballx, bally) <= leftd/2 + balld/2) {
    ballvx = (ballx - leftx)/12;
    ballvy = (bally - lefty)/12;
  }
  if (dist(rightx, righty, ballx, bally) <= rightd/2 + balld/2) {
    ballvx = (ballx - rightx)/12;
    ballvy = (bally - righty)/12;
  }

  //gameover
  if (rightscore >= 3) {
    mode = GAMEOVER;
  }

  if (leftscore >= 3) {
    mode = GAMEOVER;
  }

  //pause
  fill(blue);
  tactile1(355, 15, 30, 30);
  rect(355, 15, 30, 30);
  stroke(255);
  strokeWeight(4);
  line(365, 23, 365, 35);
  line(375, 23, 375, 35);

  //optionsssssss
  fill(blue);
  noStroke();
  tactile1(415, 15, 30, 30);
  rect(415, 15, 30, 30);
  stroke(255);
  //deco thingys
  strokeWeight(6);
  line(420, 20, 420, 20);
  line(420, 30, 420, 30);
  line(420, 40, 420, 40);
  strokeWeight(3);
  line(430, 20, 440, 20);
  line(430, 30, 440, 30);
  line(430, 40, 440, 40);
}

void gameClicks() {
  if (mouseX >= 355 && mouseX <= 385 && mouseY >= 15 && mouseY <= 45) {
    mode = PAUSE;
    click.rewind();
    click.play();
  }
  if (mouseX >= 415 && mouseX <= 445 && mouseY >= 15 && mouseY <= 45) {
    mode = OPTIONS; 
    click.rewind();
    click.play();
  }
}

void tactile1 (int x, int y, int w, int h) {
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
    fill(lavendar);
  } else {
    fill(blue);
  }
}
