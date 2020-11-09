Mapa mapa;// map obj
figura fact=new o(4, 1);//Se crea objetos
figura fsig=new l(4, 1);
figura finv=new o(4, 1);
juego juego;

void setup() {
  size(1000, 700);
  // Parameters go inside the parentheses when the object is constructed.
  background(255);
  //se crea la clase juego que se encargara de realizar las relacciones entre las samas clases
  juego=new juego();
  //crea el mapa y las piezas
  juego.init();
}

void draw() {
  //pinta las figuras, el mapa y la presentacion
  juego.paint();
  //condicion para seguir jugando
  if ((fact.quieto( mapa )==true && fact.gety()<=1 )) {
    juego.perder();
  } else {
    juego.run();
  }
}

//entradas de teclado
void keyTyped() {
  //rotar
  if ((key == 'q' || key == 'Q') && fact.limrota(mapa )==true&& fact.limladoi(mapa)&& fact.limladod(mapa) ) {
    fact.rotar();
    finv.rotar();
  }

  //juego nuevo
  if ((key == 's' || key == 'S') ) {
    juego.nuevo();
    juego.restpunt();
  }
}

void keyPressed() {
  //moover izquierda
  if (keyCode == LEFT && fact.posicion[0] +fact.limites()[1]>0 && fact.limladoi(mapa) &&juego.perder==false ) {
    fact.setposx(-1);
    finv.setposx(-1);
  }
  //moover derecha
  if (keyCode == RIGHT && fact.posicion[0] + 1 +fact.limites()[2]<mapa.getmapa()[0].length&&fact.limladod(mapa) &&juego.perder==false) {
    fact.setposx(+1);
    finv.setposx(+1);
  } 
  //bajar total
  if ((keyCode ==  ENTER) ) {
    fact.camby(finv.gety());
    juego.cambio_puntaje(100);
  }
  //bajar
  if (keyCode == DOWN) {
    juego.gravact();
    fact.cambio_grav(3);
    juego.cambio_puntaje(10);
  }
}
void keyReleased() {
  if ((keyCode == DOWN) ) {
    juego.gravdes();
    fact.cambio_grav(60);
  }
}
