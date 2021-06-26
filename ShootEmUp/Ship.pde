
class Ship {
  ShipLaserFire l;
  PVector loc;
  int speed=3;
  PVector dir= new PVector();
  boolean alive = true;
  Ship() {
    l=new ShipLaserFire();
    loc = new PVector(5, height/2);
  }

  void show() {
    if (alive) {
      fill(0, 0, 200);
      pushMatrix();
      translate(loc.x, loc.y);
      rect(0, 0, 20, 10);

      popMatrix();
      l.show();

    }
  }

  Enemy[] update(Enemy[] e) {
    if (loc.y<=5) {
      loc.y =5;
    } 
    if (loc.y>height-15) {
      loc.y=height-15;
    } 
    if (loc.x<=20) {
      loc.x =20;
    } 
    if (loc.x>width-15) {
      loc.x=width-15;
    }
    
    loc.add(dir);
    e=l.update(e);
    return e;
  }

  void fire() {

    l.fire(loc);
  }
}