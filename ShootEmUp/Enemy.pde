class Enemy {
  float xoff = random(1);
  float yoff = random(1);
  PVector loc;
  EnemyLaserFire l;
  Enemy() {

    loc = new PVector(random(width), random(height));


    l=new EnemyLaserFire();
  }

  void show() {

    pushMatrix();

    translate(loc.x, loc.y);
    fill(255, 0, 0);
    rect(0, 0, 10, 10);
    //println(loc);
    popMatrix();
  }
    
  void update(Ship s) {
    //loc.x +=random(-3,3);
    //loc.y+=random(-3,3);;
    loc.x = noise(xoff) * width;
    loc.y= noise(yoff) * height;
    xoff+=.01;
    yoff+=0.01;

    l.update(s);
    l.show();
    if (random(0, 50) < 1) {

      //enemy fires  weapon.
      l.fire(loc);
    }
  }
}