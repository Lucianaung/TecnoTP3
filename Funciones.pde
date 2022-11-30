String conseguirNombre(FBody cuerpo) {
  String nombre = "vacio";

  if (cuerpo != null)
  {
    nombre = cuerpo.getName();

    if (nombre == null)
    {
      nombre = "nada";
    }
  }
  return nombre;
}

//-------------------------------------------------------------------------------------------------------------------------------

void transiciones() {
  // CONTADOR
  /*if (frameCount%60==0) {
   tiempo --;
   } else if (estado.equals("a") && tiempo >0) {
   fill(0);
   text(tiempo,  895, 90);
   } else if (estado.equals("a") && tiempo == 0) {
   tiempo = 0;
   estado = ("b");
   }*/

  // CAPTURA
  if (estado.equals("b") && capturar==false) {
    estado = ("c");
  }

  //DORMIDO
  else if (estado.equals("c") && pelota.isSleeping()) {
    estado = ("e");
  }

  //RESETEAR
  else if (estado.equals("d") && tiempito == 0) {
    backGanar.stop();
    reset();
    tiempito = 3;
  } else  if (estado.equals("e") && tiempito == 0) {
    backPerder.stop();
    reset();
    tiempito = 3;
  }
}

void pendulo(float velocidad) {
  if (bolaPendulo.getX() > 400 + 100) {
    derecha  = false;
  } else if (bolaPendulo.getX() < 400 - 100) {
    derecha = true;
  }
  if (derecha) {
    bolaPendulo.setVelocity(velocidad, 0);
  } else {
    bolaPendulo.setVelocity (-(velocidad), 0);
  }
}

void resetPendulo (){
if (derecha){
bolaPendulo.setPosition(400, 350);
bolaPendulo.setVelocity(0,0);
} else {
bolaPendulo.setPosition(400,350);
bolaPendulo.setVelocity(0,0);
}
}
