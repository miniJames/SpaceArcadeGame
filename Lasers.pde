
class ShipLaserFire {
  ArrayList<Laser> las;

  ShipLaserFire() {
    las = new ArrayList(0);
  }

  void fire(PVector s) {
    Laser l;
    l=new Laser(s, 8);
    las.add(l);
  }
  void show() {
    for (int i=las.size()-1; i>=0; i--) {
      las.get(i).show();
    }
  }

  Enemy[] update(Enemy[] en) {
     
    for (int i=las.size()-1; i>=0; i--) {
      Laser l = las.get(i);
      l.update();
      for (int j=en.length-1; j>=0; j--) {
        //println("E " + e[j].loc);
          //println(j);
        if (l.loc.x > en[j].loc.x && l.loc.x<en[j].loc.x +10 && l.loc.y > en[j].loc.y && l.loc.y < en[j].loc.y +10 ) {
          en=rem(en, j);
          //println("enemy hit");
          las.remove(i);
          break;
        }
      }

      if (l.loc.x > width) {
        las.remove(i);
      }
    }
    return en;
  }

  Enemy[] rem(Enemy e[], int item) {
   // println("removing" + item);
    Enemy outgoing[] = new Enemy[e.length - 1];
    System.arraycopy(e, 0, outgoing, 0, item);
    System.arraycopy(e, item+1, outgoing, item, e.length - (item + 1));
    return outgoing;
  }
}

class EnemyLaserFire {
  ArrayList<Laser> las;

  EnemyLaserFire() {
    las = new ArrayList(0);
  }

  void fire(PVector s) {
    Laser l;
    l=new Laser(s, -8);
    las.add(l);
  }
  void show() {
    for (int i=las.size()-1; i>=0; i--) {
      las.get(i).show();
     }
  }

 void update(Ship s) {
    for (int i=las.size()-1; i>=0; i--) {
      Laser l = las.get(i);
      l.update();

      if (l.loc.x >s .loc.x && l.loc.x<s.loc.x +10 && l.loc.y > s.loc.y && l.loc.y < s.loc.y +10 ) {
        //println("SHIPHIT");
        s.alive = false;
      }
      if (l.loc.x < 0) {
        las.remove(i);
      }
    }
  }
}
class Laser {
  int speed=0;
  PVector loc;
  Laser(PVector s, int sp) {
    loc = new PVector(s.x + 20, s.y+5);
    speed = sp;
  }

  void show() {
    pushMatrix();


    translate(loc.x, loc.y);
    fill(255, 255, 0);
    rect(0, 0, 5, 3);
    popMatrix();
  }

  void update() {
    loc.x +=speed;
  }
}