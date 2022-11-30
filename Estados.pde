void dibujar() {
  if (mousePressed) {
    dibujos.beginDraw();
    dibujos.strokeWeight(grosorDibujo);
    dibujos.line(mouseX, mouseY, pmouseX, pmouseY);
    dibujos.endDraw();
  }
}
//-----------------------------------------------------------

//-----------------------------------------------------------
void jugar() {
  mundo.add(pelota);
  pelotaDesactivada = true;
}
//-----------------------------------------------------------
void reset() {
  mundo.clear();
  mundo.setEdges(color(0));
  background (255);
  backDibujar.stop();
  pelotaDesactivada = false;
  estadoa = false;
  estadob = false;
  estadod = false;
  estadoe = false;
  tiempo = tiempoOriginal;
  tiempito = 3;
  estado = "a";
  backDibujar.stop();
  backJugar.stop();
  backGanar.stop();
  backPerder.stop();

  meta = new FBox(50, 100);
  meta.isSensor();
  meta.setStatic(true);
  meta.setPosition(width-50/2, random(50, 550));
  meta.setStrokeWeight(grosorLinea);
  meta.setFill(255);
  meta.setStroke(150,150,150);
  meta.setName("meta");
  mundo.add(meta);
  objetos();
  resetPendulo ();
}

void iman (){
  float ix = 495-pelota.getX();
  float iy = 85-pelota.getY();
  
  if (dist(495,85,pelota.getX(), pelota.getY() )<75)
  {
  pelota.addForce(ix*50, iy*50);
}
}

//-----------------------------------------------------------
void ganar() {
  tiempito --;
  background(random(255), random(255), random(255));
}
//-----------------------------------------------------------
void perder() {
  tiempito --;
  background(0);
}
