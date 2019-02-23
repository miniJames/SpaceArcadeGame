class GameEnvironment {
  Ship s;
  Enemy e[];
  int lives = 10;
  int gameState=0;
  int enemyCount = 10;
  int level =1;
  GameEnvironment() {

    s=new Ship();

    loadEnemies(enemyCount);
  }
  void loadEnemies(int num) {
    e=new Enemy[num];
    for (int i=0; i<num; i++) {
      e[i]=new Enemy();
    }
  }
  void update() {
    if (gameState==1) {
      for (int i=0; i<e.length; i++) {

        e[i].update(s);
        e[i].show();
        //println(i);
      }
      s.show();
      e=s.update(e);
      if (s.alive==false  && lives>0) {
        lives--;

        if (lives==0) {
          gameState=0;
          enemyCount = 10;  
          level=1;
        } else {
          s=new Ship();
        }
      }
      //println(e.length);
      if (e.length ==0) {
        level++;
         
        loadEnemies(level+enemyCount);
      }
      fill(255);
      text("LIVES:" + lives, 10, 10);
      text("ENEMY:" + e.length, 10, 20);
      text("LEVEL:" + level, 10, 30);
    } else if (gameState==0){
      text("PRESS 's' TO START", width/2-45, height/2-5);
      lives=10;
      enemyCount=10;
      level=1;
    }
  }

  void keyInput() {

    if (keyCode == UP) {
      s.dir.y=-s.speed;
      println("UP");
    } else if (keyCode==DOWN) {
    
      s.dir.y=s.speed;
    } else if (keyCode==LEFT){
      println("LEFT");
      s.dir.x=-s.speed;
    } else if (keyCode==RIGHT){
      println("RIGHT");
      s.dir.x=s.speed;
    } else if (key==' ') {
      s.fire();
    } else if (key=='s' || key == 'S' ) {
      gameState=1;
      lives=10;
    }
  }
}