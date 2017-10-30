import processing.video.*;

Movie journeyMovie;

float movieSpeed = 1;
int timer = 0;
int footLiftCount = 0;

void setup() {
  size(1280, 720);
  frameRate(24);
  
  journeyMovie = new Movie(this, "A_journey_at_night_market.mov");
  journeyMovie.frameRate(1);
  journeyMovie.loop();
  
}

void draw() {
  image(journeyMovie, 0, 0, 1280, 720);
  
  kinectWalkSpeed();
  kinectJump();
  
  movieSpeedChange();
  timer++;
}

void movieSpeedChange() {
  if (timer > 24*5) {
    journeyMovie.speed(movieSpeed);
    footLiftCount = 0;
    timer = 0;
  }
  fill(255);
  text(nfc(movieSpeed, 2) + "X", 10, 30); 
}

void keyPressed() {
  if (key == 'a') {
    movieSpeed+=0.1;
  } 
  if (key == 's'){
    movieSpeed-=0.1;
  }
  if (key == 'j'){
    movieJump();
  }
}

void movieJump() {
  int randomNum = int(random(1, 8));
  switch(randomNum){
    case 1:
      journeyMovie.jump(9+30*0);
      break;
    case 2:
      journeyMovie.jump(9+30*1);
      break;
    case 3:
      journeyMovie.jump(9+30*2);
      break;
    case 4:
      journeyMovie.jump(9+30*3);
      break;
    case 5:
      journeyMovie.jump(9+30*4);
      break;
    case 6:
      journeyMovie.jump(9+30*5);
      break;
    case 7:
      journeyMovie.jump(9+30*6);
      break;
    case 8:
      journeyMovie.jump(9+30*7);
      break;
  }
}

void movieEvent(Movie m) {
  m.read();
}

void kinectWalkSpeed() {
  /*
  if(footLiftCount<5) {
    movieSpeed=0.3;
  }else if(footLiftCount>=5&&footLiftCount<10) {
    movieSpeed=1;
  }else if(footLiftCount>=10) {
    movieSpeed=2;
  }
  */
}

void kinectJump() {
  //if jump occur call movieJump()
  /*
  if(jump occur){
    movieJump();
  }
  */
}