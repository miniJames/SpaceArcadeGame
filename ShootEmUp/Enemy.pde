class Enemy {
  //float xoff = random(1);
  //float yoff = random(2);
  
  ArrayList<PVector> path;
  PVector loc;
  PVector acc;
  PVector vel;
  int currentPathItem = 0;
  EnemyLaserFire l;
  Enemy() {
    path=new ArrayList<PVector>();
 
    acc = new PVector();
    vel = new PVector();
    for(int p= 0;p<(int)random(1,10);p++){
      path.add(new PVector(random(width), random(height)));  
    }
    
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
 
  void applyForce(PVector f){
    acc.add(f);
    
  }
  void update(Ship s) {
    //loc.x +=random(-3,3);
    //loc.y+=random(-3,3);;
    //loc.x = noise(xoff) * width;
    //loc.y= noise(yoff) * height;
    //xoff+=.01;
    //yoff+=0.01;

     
    vel.add(acc);
    loc.add(vel);
    acc.set(0, 0);
 
    applyForce(seek(path.get(currentPathItem)));
    
    if(loc.x < path.get(currentPathItem).x + 5 && loc.x > path.get(currentPathItem).x - 5){
      if(loc.y < path.get(currentPathItem).y + 5 && loc.y > path.get(currentPathItem).y - 5){
        currentPathItem ++;
        if(currentPathItem > path.size()-1){
          currentPathItem=0;
        }
      }
    }
    
    l.update(s);
    l.show();
    if (random(0, 50) < 1) {

      //enemy fires  weapon.
      l.fire(loc);
    }
  }
  float maxspeed=4;
 PVector seek(PVector target) {
    PVector desired = PVector.sub(target, loc);
    desired.normalize();
    desired.mult(maxspeed);

    PVector steer = PVector.sub(desired, vel);
    steer.limit(.5);
    return steer;
  }
}
