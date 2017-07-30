public void setColor() { 

  //int [] iro =

  for (VParticle p : physics.particles) {


    int rd1 = int(random(2));

    if (rd1<1) {
      k = kao2;
    } else {
      k=kao3;
    }

    kao2.disableStyle();
    kao3.disableStyle();
    
    
    
   


    if (sq(zahyo1[0][0]- p.x)  + sq(zahyo1[1][0] - p.y) <= sq(atractor + p.getRadius())
      | sq(zahyo1[0][1]- p.x)  + sq(zahyo1[1][1] - p.y) <= sq(atractor + p.getRadius())
      | sq(zahyo1[0][2]- p.x)  + sq(zahyo1[1][2] - p.y) <= sq(atractor + p.getRadius())
      | sq(zahyo1[0][3]- p.x)  + sq(zahyo1[1][3] - p.y) <= sq(atractor + p.getRadius())
      | sq(zahyo1[0][4]- p.x)  + sq(zahyo1[1][4] - p.y) <= sq(atractor + p.getRadius())) {
      //kao2.disableStyle();
      fill(255, 0, 0);
      noStroke();
      shape(k, p.x, p.y, p.getRadius() * 6, p.getRadius() * 8);
    }else if (sq(zahyo2[0][0]- p.x)  + sq(zahyo2[1][0] - p.y) <= sq(atractor + p.getRadius())
      | sq(zahyo2[0][1]- p.x)  + sq(zahyo2[1][1] - p.y) <= sq(atractor + p.getRadius())
      | sq(zahyo2[0][2]- p.x)  + sq(zahyo2[1][2] - p.y) <= sq(atractor + p.getRadius())
      | sq(zahyo2[0][3]- p.x)  + sq(zahyo2[1][3] - p.y) <= sq(atractor + p.getRadius())
      | sq(zahyo2[0][4]- p.x)  + sq(zahyo2[1][4] - p.y) <= sq(atractor + p.getRadius())) {
      //kao2.disableStyle();
      fill(0, 255, 0);
      noStroke();
      shape(k, p.x, p.y, p.getRadius() * 6, p.getRadius() * 8);
    } 


    else if (sq(zahyo3[0][0]- p.x)  + sq(zahyo3[1][0] - p.y) <= sq(atractor + p.getRadius())
      | sq(zahyo3[0][1]- p.x)  + sq(zahyo3[1][1] - p.y) <= sq(atractor + p.getRadius())
      | sq(zahyo3[0][2]- p.x)  + sq(zahyo3[1][2] - p.y) <= sq(atractor + p.getRadius())
      | sq(zahyo3[0][3]- p.x)  + sq(zahyo3[1][3] - p.y) <= sq(atractor + p.getRadius())
      | sq(zahyo3[0][4]- p.x)  + sq(zahyo3[1][4] - p.y) <= sq(atractor + p.getRadius())) {
      //kao2.disableStyle();
      fill(0, 0, 255);
      noStroke();
      shape(k, p.x, p.y, p.getRadius() * 6, p.getRadius() * 8);
    } else {
      //kao2.disableStyle();
      fill(200);
      noStroke();
      shape(k, p.x, p.y, p.getRadius() * 6, p.getRadius() * 8);
    }
 
  }
  }