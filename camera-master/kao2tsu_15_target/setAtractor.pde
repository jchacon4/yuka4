//set position and shape of attractors (only the present ones)
public void set(int nk, int l) {
  target.disableStyle();

  if (i==0) {    
    if (l>1) {
      at1.setAttractor(new Vec(zahyo1[0][0], zahyo1[1][0]));
      at1.setRadius(200);
      at1.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at1.getAttractor().x +20, at1.getAttractor().y +20, at1.getRadius(), at1.getRadius());
    }
    if (l>2) {
      at2.setAttractor(new Vec(zahyo1[0][1], zahyo1[1][1]));
      at2.setRadius(200);
      at2.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at2.getAttractor().x +20, at2.getAttractor().y +20, at2.getRadius(), at2.getRadius());
    }

    if (l>3) {
      at3.setAttractor(new Vec(zahyo1[0][2], zahyo1[1][2]));
      at3.setRadius(200);
      at3.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at3.getAttractor().x +20, at3.getAttractor().y +20, at3.getRadius(), at3.getRadius());
    }

    if (l>4) {
      at4.setAttractor(new Vec(zahyo1[0][3], zahyo1[1][3]));
      at4.setRadius(200);
      at4.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at4.getAttractor().x +20, at4.getAttractor().y +20, at4.getRadius(), at4.getRadius());
    }

    if (l>5) {
      at5.setAttractor(new Vec(zahyo1[0][4], zahyo1[1][4]));
      at5.setRadius(200);
      at5.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at5.getAttractor().x +20, at5.getAttractor().y +20, at5.getRadius(), at5.getRadius());
    }
  }

  if (i==1) {    
    if (l>1) {
      at6.setAttractor(new Vec(zahyo2[0][0], zahyo3[1][0]));
      at6.setRadius(200);
      at6.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at6.getAttractor().x +20, at6.getAttractor().y +20, at6.getRadius(), at6.getRadius());
    }
    if (l>2) {
      at7.setAttractor(new Vec(zahyo2[0][1], zahyo2[1][1]));
      at7.setRadius(200);
      at7.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at7.getAttractor().x +20, at7.getAttractor().y +20, at7.getRadius(), at7.getRadius());
    }

    if (l>3) {
      at8.setAttractor(new Vec(zahyo2[0][2], zahyo2[1][2]));
      at8.setRadius(200);
      at8.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at8.getAttractor().x +20, at8.getAttractor().y +20, at8.getRadius(), at8.getRadius());
    }

    if (l>4) {
      at9.setAttractor(new Vec(zahyo2[0][3], zahyo2[1][3]));
      at9.setRadius(200);
      at9.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at9.getAttractor().x +20, at9.getAttractor().y +20, at9.getRadius(), at9.getRadius());
    }

    if (l>5) {
      at10.setAttractor(new Vec(zahyo2[0][4], zahyo2[1][4]));
      at10.setRadius(200);
      at10.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at10.getAttractor().x +20, at10.getAttractor().y +20, at10.getRadius(), at10.getRadius());
    }
  }


  if (i==2) {    
    if (l>1) {
      at11.setAttractor(new Vec(zahyo3[0][0], zahyo3[1][0]));
      at11.setRadius(200);
      at11.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at11.getAttractor().x +20, at11.getAttractor().y +20, at11.getRadius(), at11.getRadius());
    }
    if (l>2) {
      at12.setAttractor(new Vec(zahyo3[0][1], zahyo3[1][1]));
      at12.setRadius(200);
      at12.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at12.getAttractor().x +20, at12.getAttractor().y +20, at12.getRadius(), at12.getRadius());
    }

    if (l>3) {
      at13.setAttractor(new Vec(zahyo3[0][2], zahyo3[1][2]));
      at13.setRadius(200);
      at13.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at13.getAttractor().x +20, at13.getAttractor().y +20, at13.getRadius(), at13.getRadius());
    }

    if (l>4) {
      at14.setAttractor(new Vec(zahyo3[0][3], zahyo3[1][3]));
      at14.setRadius(200);
      at14.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at14.getAttractor().x +20, at14.getAttractor().y +20, at14.getRadius(), at14.getRadius());
    }

    if (l>5) {
      at15.setAttractor(new Vec(zahyo3[0][4], zahyo3[1][4]));
      at15.setRadius(200);
      at15.setStrength(.1f);
      fill(100);
      noStroke();
      shape(target,at15.getAttractor().x +20, at15.getAttractor().y +20, at15.getRadius(), at15.getRadius());
    }
  }
}