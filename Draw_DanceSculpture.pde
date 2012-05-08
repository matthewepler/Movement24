import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam camera;

import processing.opengl.*;

String[] hand5;
String[] hand8;
PVector[] hand5PV;
PVector[] hand8PV;
float cutter = 0.50;
int counter;

void setup() {
  size(1000, 800, OPENGL);
  loadHandData();
  camera = new PeasyCam(this, int(hand5PV[0].x*cutter+950), int(hand5PV[0].y*cutter-500), int(hand5PV[0].z*cutter+500), 105);
  camera.setSuppressRollRotationMode();
  background(0);
}

void draw() {
  stroke(255, 125);
  strokeWeight(3);
  counter = frameCount;
  if (counter<hand5PV.length) {
    pushMatrix();
    rotateZ(radians(-10));
    rotateX(360);
    rotateY(45);
    drawLine(counter);
    popMatrix();
  } 
  else {
    background(0);
    for (int i=1; i<hand5PV.length; i++) {
      pushMatrix();
      rotateZ(15);
      rotateX(360);
      rotateY(45);
      fill(random(255/i), random(255/i), random(255/i), 125);
      drawLine(i); 
      popMatrix();
    }
  }
}

void loadHandData() {
  hand5 = loadStrings("5.txt");
  hand8 = loadStrings("8.txt");
  hand5PV = new PVector[hand5.length];
  hand8PV = new PVector[hand5.length];
  for (int i=0; i<hand5.length; i++) {
    float[] thisFloat = float(split(hand5[i], ","));
    PVector thisPV = new PVector(); // new PVector function fills it with 0's, otherwise they're null
    thisPV.x = thisFloat[0]*cutter;
    thisPV.y = thisFloat[1]*cutter;
    thisPV.z = thisFloat[2]*cutter;
    hand5PV[i] = thisPV;
  }
  for (int i=0; i<hand8.length; i++) {
    float[] thisFloat = float(split(hand8[i], ","));
    PVector thisPV = new PVector(); // new PVector function fills it with 0's, otherwise they're null
    thisPV.x = thisFloat[0]*cutter;
    thisPV.y = thisFloat[1]*cutter;
    thisPV.z = thisFloat[2]*cutter;
    hand8PV[i] = thisPV;
  }
}

void drawLine(int _i) {
  line(hand5PV[_i].x, hand5PV[_i].y, hand5PV[_i].z, hand8PV[_i].x, hand8PV[_i].y, hand8PV[_i].z);
}

