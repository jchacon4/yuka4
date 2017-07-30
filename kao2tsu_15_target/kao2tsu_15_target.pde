
import punktiert.math.Vec;
import punktiert.physics.*;

JSONArray json1;
JSONArray json2;
JSONArray json3;
PShape k;
PShape kao2;
PShape kao3;
PShape target;
int x;
int y;
int nk;
int i;
int j;




float atractor=100;

BAttraction at1, at2, at3, at4, at5, at6, at7, at8, at9, at10, at11, at12, at13, at14, at15;

int users[];


int[][] zahyo1 = new int[2][5];
int[][] zahyo2 = new int[2][5];
int[][] zahyo3 = new int[2][5];

// world object
VPhysics physics;

// attractor


// number of particles in the scene
int amount = 150;

public void setup() {
  size(800, 450);
  noStroke();
  kao2 = loadShape("kao2.svg");
  kao3 = loadShape("kao3.svg");
  target = loadShape("target.svg");



  //set up physics
  physics = new VPhysics();
  physics.setfriction(.1f);




  for (int i = 1; i < amount; i++) {
    // val for arbitrary radius
    float rad = random(2, 15);
    // vector for position
    Vec pos = new Vec(random(rad, width - rad), random(rad, height - rad));
    // create particle (Vec pos, mass, radius)
    VParticle particle = new VParticle(pos, 4, rad);
    // add Collision Behavior
    particle.addBehavior(new BCollision());
    // add particle to world
    physics.addParticle(particle);
  }


  at1 = new BAttraction(new Vec(width * .5f, height * .5f), 0, .0f);
  physics.addBehavior(at1);

  at2 = new BAttraction(new Vec(width * .5f, height * .5f), 0, .0f);
  physics.addBehavior(at2);

  at3 = new BAttraction(new Vec(width * .5f, height * .5f), 0, .0f);
  physics.addBehavior(at3);

  at4 = new BAttraction(new Vec(width * .5f, height * .5f), 0, .0f);
  physics.addBehavior(at4);

  at5 = new BAttraction(new Vec(width * .5f, height * .5f), 50, .0f);
  physics.addBehavior(at5);

  at6 = new BAttraction(new Vec(width * .5f, height * .5f), 0, .0f);
  physics.addBehavior(at6);

  at7 = new BAttraction(new Vec(width * .5f, height * .5f), 0, .0f);
  physics.addBehavior(at7);

  at8 = new BAttraction(new Vec(width * .5f, height * .5f), 0, .0f);
  physics.addBehavior(at8);

  at9 = new BAttraction(new Vec(width * .5f, height * .5f), 0, .0f);
  physics.addBehavior(at9);

  at10 = new BAttraction(new Vec(width * .5f, height * .5f), 50, .0f);
  physics.addBehavior(at10);

  at11 = new BAttraction(new Vec(width * .5f, height * .5f), 0, .0f);
  physics.addBehavior(at11);

  at12 = new BAttraction(new Vec(width * .5f, height * .5f), 0, .0f);
  physics.addBehavior(at12);

  at13 = new BAttraction(new Vec(width * .5f, height * .5f), 0, .0f);
  physics.addBehavior(at13);

  at14 = new BAttraction(new Vec(width * .5f, height * .5f), 0, .0f);
  physics.addBehavior(at14);

  at15 = new BAttraction(new Vec(width * .5f, height * .5f), 50, .0f);
  physics.addBehavior(at15);
}



public void draw() {

  json1 = loadJSONArray("https://yukachan-ed770.firebaseio.com/floors/-KpFmeKGYKti1espnifp/floor1.json"); //user1,user2,user3
  json2 = loadJSONArray("https://yukachan-ed770.firebaseio.com/floors/-KpFmeKGYKti1espnifp/floor2.json");
  json3 = loadJSONArray("https://yukachan-ed770.firebaseio.com/floors/-KpFmeKGYKti1espnifp/floor3.json");

  JSONArray floors = new JSONArray();
  floors.setJSONArray(0, json1); //(number,array)  set=add
  floors.setJSONArray(1, json2);
  floors.setJSONArray(2, json3);



  //int userSize = 0;


  background(255);

  for (  i = 0; i < floors.size(); i++) {

    JSONArray item = floors.getJSONArray(i);  //number i no json into item  // get set

    for (int j = 1; j < item.size(); j++) {
      JSONObject user = item.getJSONObject(j);

      int id = user.getInt("id"); //soeji
          nk = user.getInt("nk");
      int x = user.getInt("x");
      int y = user.getInt("y");


      //co=iro[nk-1];
      //co=100;

      if (i==0) {   

        zahyo1[0][id-1]=x;
        zahyo1[1][id-1]=y;

        //ball(id,nk,x,y);

        set(nk, item.size());   //index, element  set*3=atract kaz
    
      }

      if (i==1) {

        zahyo2[0][id-1]=x;
        zahyo2[1][id-1]=y;

        //ball(id,nk,x,y);

        set(nk, item.size());
        
      }

      if (i==2) {

        zahyo3[0][id-1]=x;
        zahyo3[1][id-1]=y;
        //ball(id,nk,x,y);

        set(nk, item.size());
        
        
      }
      setColor();
      //set shape and position of present attractors
    }
    physics.update();
    
  }  
}