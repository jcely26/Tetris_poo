class juego {
  //atributos
  int puntaje=0;
  boolean perder=false;
  int puntajeln=0;
  int niveles=1;
  boolean estgrav=false;

  //metodos

  //crear mapa y figuras
  void init() {
    mapa =new Mapa(10, 20); 
    mapa.paint();
    this.piezanueva(this.rand());
    fsig.camby(5);
    fsig.cambx(15);
    this.crearinv();

    finv.setrelleno(color(100, 100, 100, 150));
  }

  //creamos la presentacion donde se mostrara puntajes y demas

  void presentacion() {
    fill(255);
    rect(0, 0, 1000, 700);
    fill(0);
    rect(width/2+250, height/2-300, 200, 250);
    rect(width/2-450, height/2-300, 200, 600);
    rect(width/2+250, height/2, 200, 300);

    strokeWeight(1);
    textSize(30);
    fill(240, 48, 200);
    text(niveles, 840, 430);
    text(puntajeln, 840, 520);
    text(puntaje, 840, 610);
    text("S ", 135, 180);
    text("Q ", 135, 260);
    text("ENTER ", 105, 580);
    text("← ", 135, 420);
    text("→ ", 135, 500);
    text("↓ ", 135, 340);
    fill(255);
    text("CONTROLES ", 60, 100);
    text("PIEZA", 810, 100);
    text("SIGUIENTE", 770, 140);
    textSize(25);
    text("NIVEL", 820, 390);
    text("LÍNEAS", 810, 480);
    text("SCORE", 810, 570);


    textSize(20);
    text("JUEGO NUEVO ", 80, 140);
    text("ROTAR ", 110, 220);
    text("SOLTAR ", 110, 540);
    text("IZQUIERDA ", 100, 380);
    text("DERECHA ", 110, 460);
    text("BAJAR LENTO ", 90, 300);
  }

  //retornamos un numero random  
  int rand() {
    int g=0;
    while (g==0) {    
      g =int(random(8));
    }
    return g;
  }

  //cambiamos la figura actual por la siguiente y creamos una figura sig nueva aleatorea
  void piezanueva(int g) {
    fact=fsig;
    switch (g) {
    case 1:
      fsig=new z(4, 1);
      break;
    case 2:
      fsig=new s(4, 1);
      break;
    case 3:
      fsig=new i(4, 1);
      break;
    case 4:
      fsig=new j(4, 1);
      break;
    case 5:
      fsig=new l(4, 1);
      break;
    case 6:
      fsig=new o(4, 1);
      break;
    case 7:
      fsig=new t(4, 1);
      break;
    }
  }

  //creamos la invisible igual a alguna otra
  void piezanueva2(int g) {
    switch (g) {
    case 1:
      finv=new z(4, 1);
      break;
    case 2:
      finv=new s(4, 1);
      break;
    case 3:
      finv=new i(4, 1);
      break;
    case 4:
      finv=new j(4, 1);
      break;
    case 5:
      finv=new l(4, 1);
      break;
    case 6:
      finv=new o(4, 1);
      break;
    case 7:
      finv=new t(4, 1);
      break;
    }
  }

  //creamos la figura invisible, igual a la actual 
  void crearinv() {
    piezanueva2(fact.getname());
  }

  //nuevo
  void nuevo() {
    this.niveles=1;
    this.perder=false;
    this.presentacion();
    fact.rest();
    finv.rest();
    mapa =new Mapa(10, 20);
  }

  //copimaos las coordenadas en y de la actual en la invisible
  void restyinv() {
    finv.camby(fact.gety());
  }


  //todo:v
  void run() {
    this.niveles();
    this.restyinv();
    finv.camby(finv.inv(mapa));
    this.deadficha(fact, mapa);
    //fsig.posx();
    fact.move();
    this.paint();
    mapa.actualizar_mapa();
  }

  //perder pantalla
  void perder() {

    this.perder=true;
    fill(0);
    rect(0, 0, 1000, 700);
    fill(255, 0, 0);
    textSize (100);
    text("GAME OVER", 200, 250);
    textSize (50);
    text("Perdiste, sigue intentando", 180, 350);
    text("Vuelve a jugar con s", 230, 450);
    text("Puntaje : ", 290, 600);
    text( this.getpuntaje(), 550, 600);
  }

  //actualizar puntaje
  void cambio_puntaje(int p) {
    this.puntaje+=p;
  }
  void cambio_puntajeln(int p) {
    this.puntajeln+=p;
  }
  int getpuntaje() {
    return puntaje;
  }
  //restablecemos los puntajes
  void restpunt() {
    this.puntaje=0;
    this.puntajeln=0;
  }

  //pintar todo
  void paint() {
    this.presentacion();
    mapa.paint();
    fact.paint();
    finv.paint();
    fsig.paint();
  }

  //cunado la ficha llega al tope
  void deadficha(figura f, Mapa m) {
    if (f.quieto(m)==true) {
      m.guardar( f);
      piezanueva(this.rand());
      fsig.camby(5);
      fsig.cambx(15);
      crearinv();
      finv.setrelleno(color(100, 100, 100, 150));

      fact.rest();
      finv.rest();
    }
  }
  void niveles() {
    if (this.estgrav) {
    } else {  
      fact.cambio_grav(60/niveles);
    }
  }
  void estniveles() {
    if (this.puntajeln%5==0) {
      niveles+=1;
    }
  }
  void gravact() {
    estgrav=true;
  }

  void  gravdes() {
    estgrav=false;
  }
}  
