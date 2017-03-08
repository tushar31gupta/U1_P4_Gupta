int snakeX = 1250;
int snakeY = 450;
float[] foodX = new float [15];
float[] foodY = new float [15];
int snakespeed = 7;
float[] colour = new float [25];
import ddf.minim.*;
Minim minim;
AudioPlayer song; 
AudioInput input;

void setup()
{
  
   minim = new Minim(this);
  song = minim.loadFile("musicproject.mp3");
  song.play();
  
  noStroke ();
  
  fullScreen();

  for (int i = 0; i < 15; i++)
  {
    foodX [i] = random (100, 1150);
    foodY [i] = random (150, 750);
  }
}
void draw()
{
  background (snakeY);

  for (int i = 0; i < 15; i++)
  {
    ellipse (foodX [i], foodY [i], 50, 50 );  

    if (dist(foodX [i], foodY [i], snakeX, snakeY) < 75)
    {
      snakespeed = 0;
      text("GAME OVER", width/2 - 175, 45);
      
      textSize(50);
    }
  }

  if (snakeX <= 150)
  {
    text("YOU WIN!!!!!", width/2 -175, 45);
 
    textSize(50); 
    snakespeed = 0;
  }


  // Designing the sidebar 

  rect (50, 50, 50, 800);
  rect (50, 50, 1300, 50);
  rect (1300, 50, 50, 800); 
  rect (50, 800, 1300, 50);

  // Border into the game

  if (snakeX > 1250 || snakeX < 150) {
    snakespeed = snakespeed *-1;
  }

  if (snakeY > 750 || snakeY < 150) {
    snakespeed = snakespeed *-1;
  }



  // Head

  ellipse(snakeX, snakeY, 100, 100);

  // Control

  if (key == 'w')
  {
    snakeY = snakeY - snakespeed;
  }

  if (key == 'a') 
  {
    snakeX = snakeX - snakespeed;
  }

  if (key == 's')
  {
    snakeY = snakeY + snakespeed;
  }

  if (key == 'd')
  {
    snakeX = snakeX + snakespeed;
  }

  {
  }
}