void detectar(PGraphics _dibujos) {
  dibujos = _dibujos;
  capturar = true;

  if (capturar == true) {
    receptor.actualizar(mensajes); //esto lo podemos sacar sino
    capturar = false;
  }

  for (Blob b : receptor.blobs) {
    if (b.entro) {
      if (b.actualizado) {
        if (b.age >= 300) {
          poly = new FPoly();
          int offset = 20;
          //println(b.contorno.size());
          for (int i= 0; i<b.contorno.size()-2; i+=offset) { //simplificar la forma salteando vertices
            poly.vertex(b.contorno.get(i) * width, b.contorno.get(i+1) * height);
          }
          poly.setPosition(b.centerX, b.centerY);
          poly.setStatic(true);
          poly.setGrabbable(false);
          poly.setDrawable(false);
          poly.setName("lineas");
          mundo.add(poly);
        } else if(b.age <=300){
          poly.removeFromWorld();
        }
      }
    }
  }

  dibujos.beginDraw();
  dibujos.background(255);
  dibujos.endDraw();
}
