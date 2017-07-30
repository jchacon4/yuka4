// Punktiert is a particle engine based and thought as an extension of Karsten Schmidt's toxiclibs.physics code.
// This library is developed through and for an architectural context. Based on my teaching experiences over the past couple years. (c) 2012 Daniel Köhler, daniel@lab-eds.org

//here: particles with an individual attraction force

import punktiert.math.Vec;
import punktiert.physics.*;
PShape blue;
PShape blue2;
PShape pur;
PShape pur2;
PShape pink;
PShape pink2;
PShape gray;
PShape gray2;
PShape k1;
PShape k2;
PShape k3;
PShape k4;
JSONArray json1;
JSONArray json2;
JSONArray json3;

int[][] zahyo1 = new int[2][5] ;
int[][] zahyo2 = new int[2][5] ;
int[][] zahyo3 = new int[2][5] ;
boolean[] appear = new boolean[15];


// world object
VPhysics physics;


// number of particles in the scene
int amount = 100;

//int colors[]= {#d69a37, #6a69c8, #60b851, #ab5cc6, #a8b63c, #d24699, #4fba9e, #d0542c, #6b93cf, #d04a59, #497c3d, #db89b9, #918d43, #a04d6e, #bb774c}
BAttraction attr, attr2, attr3, attr4, attr5, attr6, attr7, attr8, attr9, attr10, attr11, attr12, attr13, attr14, attr15;



public void setup() {

  for(boolean i : appear){
    i = false;
  }

  size(800, 450);


  blue = loadShape("kao_blue.svg");
  blue2 = loadShape("kao2_blue.svg");
  pur = loadShape("kao_pur.svg");
  pur2 = loadShape("kao2_pur.svg");
  pink = loadShape("kao_pink.svg");
  pink2 = loadShape("kao2_pink.svg");
  gray = loadShape("kao_pink.svg");
  gray2 = loadShape("kao2_pink.svg");

  blue.disableStyle();
  blue2.disableStyle();
  pur.disableStyle();
  pur2.disableStyle();
  pink.disableStyle();
  pink2.disableStyle();
  gray.disableStyle();
  gray2.disableStyle();


  physics = new VPhysics();
  physics.setfriction(.2f);

  attr = new BAttraction(new Vec(-2000,-2000 ), 0, .0f);
  attr2 = new BAttraction(new Vec(-2000,-2000), 0, .0f);
  attr3 = new BAttraction(new Vec(-2000,-2000), 0, .0f);
  attr4 = new BAttraction(new Vec(-2000,-2000), 0, .0f);
  attr5 = new BAttraction(new Vec(-2000,-2000), 0, .0f);
  attr6 = new BAttraction(new Vec(-2000,-2000), 0, .0f);
  attr7 = new BAttraction(new Vec(-2000,-2000), 0, .0f);
  attr8 = new BAttraction(new Vec(-2000,-2000), 0, .0f);
  attr9 = new BAttraction(new Vec(-2000,-2000), 0, .0f);
  attr10 = new BAttraction(new Vec(-2000,-2000), 0, .0f);
  attr11 = new BAttraction(new Vec(-2000,-2000), 0, .0f);
  attr12 = new BAttraction(new Vec(-2000,-2000), 0, .0f);
  attr13 = new BAttraction(new Vec(-2000,-2000), 0, .0f);
  attr14 = new BAttraction(new Vec(-2000,-2000), 0, .0f);
  attr15 = new BAttraction(new Vec(-2000,-2000), 0, .0f);

  physics.addBehavior(attr);
  physics.addBehavior(attr2);
  physics.addBehavior(attr3);
  physics.addBehavior(attr4);
  physics.addBehavior(attr5);
  physics.addBehavior(attr6);
  physics.addBehavior(attr7);
  physics.addBehavior(attr8);
  physics.addBehavior(attr9);
  physics.addBehavior(attr10);
  physics.addBehavior(attr11);
  physics.addBehavior(attr12);
  physics.addBehavior(attr13);
  physics.addBehavior(attr14);
  physics.addBehavior(attr15);

  for (int i = 0; i < amount; i++) {
    // val for arbitrary radius
    float rad = random(10, 30);
    // vector for position
    Vec pos = new Vec(random(rad, width - rad), random(rad, height - rad));
    // create particle (Vec pos, mass, radius)
    VParticle particle = new VParticle(pos, 2, rad);
    // add Collision Behavior
    particle.addBehavior(new BCollision());
    // add Local Attractor on each Particle (radius, strength)
    particle.addBehavior(new BAttractionLocal(rad*5, 2));
    // add particle to world
    physics.addParticle(particle);
  }
}

public void draw() {
  background(255);

  physics.update();

  noFill();
  noStroke();


  //import json
  json1 = loadJSONArray("http://localhost:8000/f1.json"); //user1,user2,user3
  json2 = loadJSONArray("http://localhost:8000/f2.json");
  json3 = loadJSONArray("http://localhost:8000/f3.json");



  if (json1.getJSONObject(1).getBoolean("show") == true){
    zahyo1[0][0]= json1.getJSONObject(1).getInt("x");
    zahyo1[1][0]= json1.getJSONObject(1).getInt("y");
    attr.setRadius(200);
    attr.setStrength(0.1f);
    attr.setAttractor(new Vec(zahyo1[0][0], zahyo1[1][0]));

  }else{
    zahyo1[0][0]= -2000;
    zahyo1[1][0]= -2000;
    attr.setRadius(0);
    attr.setStrength(0.0f);
    attr.setAttractor(new Vec(zahyo1[0][0], zahyo1[1][0]));

  }

  if (json1.getJSONObject(2).getBoolean("show") == true){
    zahyo1[0][1]= json1.getJSONObject(2).getInt("x");
    zahyo1[1][1]= json1.getJSONObject(2).getInt("y");
    attr2.setRadius(200);
    attr2.setStrength(0.1f);
    attr2.setAttractor(new Vec(zahyo1[0][1], zahyo1[1][1]));

  }else{
    zahyo1[0][1]= -2000;
    zahyo1[1][1]= -2000;
    attr2.setRadius(0);
    attr2.setStrength(0.0f);
    attr2.setAttractor(new Vec(zahyo1[0][1], zahyo1[1][1]));

  }

  if (json1.getJSONObject(3).getBoolean("show") == true){
    zahyo1[0][2]= json1.getJSONObject(3).getInt("x");
    zahyo1[1][2]= json1.getJSONObject(3).getInt("y");
    attr3.setRadius(200);
    attr3.setStrength(0.2f);
  }else{
    attr3.setRadius(0);
    attr3.setStrength(0.0f);
  }

  if (json1.getJSONObject(4).getBoolean("show") == true){
    zahyo1[0][3]= json1.getJSONObject(4).getInt("x");
    zahyo1[1][3]= json1.getJSONObject(4).getInt("y");
    attr4.setRadius(200);
    attr4.setStrength(0.2f);
  }else{
    attr4.setRadius(0);
    attr4.setStrength(0.0f);
  }

  if (json1.getJSONObject(5).getBoolean("show") == true){
    zahyo1[0][4]= json1.getJSONObject(5).getInt("x");
    zahyo1[1][4]= json1.getJSONObject(5).getInt("y");
    attr5.setRadius(200);
    attr5.setStrength(0.2f);
  }else{
    attr5.setRadius(0);
    attr5.setStrength(0.0f);
  }




  //

  if (json2.getJSONObject(1).getBoolean("show") == true){
    zahyo2[0][0]= json2.getJSONObject(1).getInt("x");
    zahyo2[1][0]= json2.getJSONObject(1).getInt("y");
    attr6.setRadius(200);
    attr6.setStrength(0.2f);
  }else{
    attr6.setRadius(0);
    attr6.setStrength(0.0f);
  }

  if (json2.getJSONObject(2).getBoolean("show") == true){
    zahyo2[0][1]= json2.getJSONObject(2).getInt("x");
    zahyo2[1][1]= json2.getJSONObject(3).getInt("y");
    attr7.setRadius(200);
    attr7.setStrength(0.2f);
  }else{
    attr7.setRadius(0);
    attr7.setStrength(0.0f);
  }

  if (json2.getJSONObject(3).getBoolean("show") == true){
    zahyo2[0][2]= json2.getJSONObject(3).getInt("x");
    zahyo2[1][2]= json2.getJSONObject(3).getInt("y");
    attr8.setRadius(200);
    attr8.setStrength(0.2f);
  }else{
    attr8.setRadius(0);
    attr8.setStrength(0.0f);
  }

  if (json2.getJSONObject(4).getBoolean("show") == true){
    zahyo2[0][3]= json2.getJSONObject(4).getInt("x");
    zahyo2[1][3]= json2.getJSONObject(4).getInt("y");
    attr9.setRadius(200);
    attr9.setStrength(0.2f);
  }else{
    attr9.setRadius(0);
    attr9.setStrength(0.0f);
  }

  if (json2.getJSONObject(5).getBoolean("show") == true){
    zahyo2[0][4]= json2.getJSONObject(5).getInt("x");
    zahyo2[1][4]= json2.getJSONObject(5).getInt("y");
    attr10.setRadius(200);
    attr10.setStrength(0.2f);
  }else{
    attr10.setRadius(0);
    attr10.setStrength(0.0f);
  }


  //

  if (json3.getJSONObject(1).getBoolean("show") == true){
    zahyo3[0][0]= json3.getJSONObject(1).getInt("x");
    zahyo3[1][0]= json3.getJSONObject(1).getInt("y");
    attr11.setRadius(200);
    attr11.setStrength(0.2f);
  }else{
    attr11.setRadius(0);
    attr11.setStrength(0.0f);
  }

  if (json3.getJSONObject(2).getBoolean("show") == true){
    zahyo3[0][1]= json3.getJSONObject(2).getInt("x");
    zahyo3[1][1]= json3.getJSONObject(2).getInt("y");
    attr12.setRadius(200);
    attr12.setStrength(0.2f);
  }else{
    attr12.setRadius(0);
    attr12.setStrength(0.0f);
  }

  if (json3.getJSONObject(3).getBoolean("show") == true){
    zahyo3[0][2]= json3.getJSONObject(3).getInt("x");
    zahyo3[1][2]= json3.getJSONObject(3).getInt("y");
    attr13.setRadius(200);
    attr13.setStrength(0.2f);
  }else{
    attr13.setRadius(0);
    attr13.setStrength(0.0f);
  }

  if (json3.getJSONObject(4).getBoolean("show") == true){
    zahyo3[0][3]= json3.getJSONObject(4).getInt("x");
    zahyo3[1][3]= json3.getJSONObject(4).getInt("y");
    attr14.setRadius(200);
    attr14.setStrength(0.2f);
  }else{
    attr14.setRadius(0);
    attr14.setStrength(0.0f);
  }

  if (json3.getJSONObject(5).getBoolean("show") == true){
    zahyo3[0][4]= json3.getJSONObject(5).getInt("x");
    zahyo3[1][4]= json3.getJSONObject(5).getInt("y");
    attr15.setRadius(200);
    attr15.setStrength(0.2f);
  }else{
    attr15.setRadius(0);
    attr15.setStrength(0.0f);
  }


  attr2.setAttractor(new Vec(zahyo1[0][1], zahyo1[1][1]));
  attr3.setAttractor(new Vec(zahyo1[0][2], zahyo1[1][2]));
  attr4.setAttractor(new Vec(zahyo1[0][3], zahyo1[1][3]));
  attr5.setAttractor(new Vec(zahyo1[0][4], zahyo1[1][4]));


  attr6.setAttractor(new Vec(zahyo2[0][0], zahyo2[1][0]));
  attr7.setAttractor(new Vec(zahyo2[0][1], zahyo2[1][1]));
  attr8.setAttractor(new Vec(zahyo2[0][2], zahyo2[1][2]));
  attr9.setAttractor(new Vec(zahyo2[0][3], zahyo2[1][3]));
  attr10.setAttractor(new Vec(zahyo2[0][4], zahyo2[1][4]));


  attr11.setAttractor(new Vec(zahyo3[0][0], zahyo3[1][0]));
  attr12.setAttractor(new Vec(zahyo3[0][1], zahyo3[1][1]));
  attr13.setAttractor(new Vec(zahyo3[0][2], zahyo3[1][2]));
  attr14.setAttractor(new Vec(zahyo3[0][3], zahyo3[1][3]));
  attr15.setAttractor(new Vec(zahyo3[0][4], zahyo3[1][4]));


  ellipse(attr.getAttractor().x, attr.getAttractor().y, attr.getRadius(), attr.getRadius());
  ellipse(attr2.getAttractor().x, attr2.getAttractor().y, attr2.getRadius(), attr2.getRadius());
  ellipse(attr3.getAttractor().x, attr3.getAttractor().y, attr3.getRadius(), attr3.getRadius());
  ellipse(attr4.getAttractor().x, attr4.getAttractor().y, attr4.getRadius(), attr4.getRadius());
  ellipse(attr5.getAttractor().x, attr5.getAttractor().y, attr5.getRadius(), attr5.getRadius());
  ellipse(attr6.getAttractor().x, attr6.getAttractor().y, attr6.getRadius(), attr6.getRadius());
  ellipse(attr7.getAttractor().x, attr7.getAttractor().y, attr7.getRadius(), attr7.getRadius());
  ellipse(attr8.getAttractor().x, attr8.getAttractor().y, attr8.getRadius(), attr8.getRadius());
  ellipse(attr9.getAttractor().x, attr9.getAttractor().y, attr9.getRadius(), attr9.getRadius());
  ellipse(attr10.getAttractor().x, attr10.getAttractor().y, attr10.getRadius(), attr10.getRadius());
  ellipse(attr11.getAttractor().x, attr11.getAttractor().y, attr11.getRadius(), attr11.getRadius());
  ellipse(attr12.getAttractor().x, attr12.getAttractor().y, attr12.getRadius(), attr12.getRadius());
  ellipse(attr13.getAttractor().x, attr13.getAttractor().y, attr13.getRadius(), attr13.getRadius());
  ellipse(attr14.getAttractor().x, attr14.getAttractor().y, attr14.getRadius(), attr14.getRadius());
  ellipse(attr15.getAttractor().x, attr15.getAttractor().y, attr15.getRadius(), attr15.getRadius());

  VParticleGroup f1 = new VParticleGroup();
  VParticleGroup f2 = new VParticleGroup();
  VParticleGroup f3 = new VParticleGroup();
  VParticleGroup f4 = new VParticleGroup();

  int f1p = 0;
  int f2p = 0;
  int f3p  = 0;
  int f4p = 0;

  for (VParticle p : physics.particles) {



    if(sq(attr.getAttractor().x- p.x)  + sq(attr.getAttractor().y - p.y) <= sq(50 + p.getRadius()) || sq(attr2.getAttractor().x- p.x)  + sq(attr2.getAttractor().y - p.y) <= sq(50 + p.getRadius()) || sq(attr3.getAttractor().x- p.x)  + sq(attr3.getAttractor().y - p.y) <= sq(50 + p.getRadius()) || sq(attr4.getAttractor().x- p.x)  + sq(attr4.getAttractor().y - p.y) <= sq(50 + p.getRadius()) || sq(attr5.getAttractor().x- p.x)  + sq(attr5.getAttractor().y - p.y) <= sq(50 + p.getRadius())){
      f1.addParticle(p);
     f1p +=1;
    }

    else if
      (sq(attr6.getAttractor().x- p.x)  + sq(attr6.getAttractor().y - p.y) <= sq(50 + p.getRadius()) || sq(attr7.getAttractor().x- p.x)  + sq(attr7.getAttractor().y - p.y) <= sq(50 + p.getRadius()) || sq(attr8.getAttractor().x- p.x)  + sq(attr8.getAttractor().y - p.y) <= sq(50 + p.getRadius()) || sq(attr9.getAttractor().x- p.x)  + sq(attr9.getAttractor().y - p.y) <= sq(50 + p.getRadius()) || sq(attr10.getAttractor().x- p.x)  + sq(attr10.getAttractor().y - p.y) <= sq(50 + p.getRadius())){
       f2.addParticle(p);
       f2p +=1;

     }

  else if
      (sq(attr11.getAttractor().x- p.x)  + sq(attr11.getAttractor().y - p.y) <= sq(50 + p.getRadius()) || sq(attr12.getAttractor().x- p.x)  + sq(attr12.getAttractor().y - p.y) <= sq(50 + p.getRadius()) || sq(attr13.getAttractor().x- p.x)  + sq(attr13.getAttractor().y - p.y) <= sq(50 + p.getRadius()) || sq(attr14.getAttractor().x- p.x)  + sq(attr14.getAttractor().y - p.y) <= sq(50 + p.getRadius()) || sq(attr15.getAttractor().x- p.x)  + sq(attr15.getAttractor().y - p.y) <= sq(50 + p.getRadius())){
       f3.addParticle(p);
       f3p +=1;

    }
  else
      {
       f4.addParticle(p);
       f4p +=1;
    }



}



    int rd1 = int(random(2));
    if (rd1<1) {
      k1 = blue;
    } else {
      k1 = blue2;
    }

    int rd2 = int(random(2));
    if (rd2<1) {
      k2 = pur;
    } else {
      k2 = pur2;
    }

    int rd3 = int(random(2));
    if (rd3<1) {
      k3 = pink;
    } else {
      k3 = pink2;
    }

    int rd4 = int(random(2));
    if (rd4<1) {
      k4 = gray;
    } else {
      k4 = gray2;
    }


for(int k = 0; k<f1p; k++){

  fill(98,98,305);
  shape(k1,f1.getParticle(k).x, f1.getParticle(k).y, f1.getParticle(k).getRadius() * 2, f1.getParticle(k).getRadius() * 2);

}

for(int k = 0; k<f2p; k++){

  fill(173,102,250);
  shape(k2,f2.getParticle(k).x, f2.getParticle(k).y, f2.getParticle(k).getRadius() * 2, f2.getParticle(k).getRadius() * 2);

}

for(int k = 0; k<f3p; k++){

  fill(239,132,203);
  shape(k3,f3.getParticle(k).x, f3.getParticle(k).y, f3.getParticle(k).getRadius() * 2, f3.getParticle(k).getRadius() * 2);

}

for(int k = 0; k<f4p; k++){

  fill(0,0,0);
  shape(k4,f4.getParticle(k).x, f4.getParticle(k).y, f4.getParticle(k).getRadius() * 2, f4.getParticle(k).getRadius() * 2);

}

}