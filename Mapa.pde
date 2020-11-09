class Mapa { 

  //atributos  
  int[][]mapa;


  // The Constructor
  Mapa(int fila, int columna) { 
    mapa = new int[columna][fila];
    for (int i=0; i<fila; i++) {
      for (int j=0; j<columna; j++) {
        if (j==columna-1) {
          mapa[j][i]=10;
        } else {
          mapa[j][i]=0;
        }
      }
    }
  }
  int[][] getmapa() {

    return mapa;
  }

  //guardar el nombre(nume) de la figura en el mapa  
  void guardar(figura f) {
    int a;
    int b;
    int [][] aux=f.getauxiliar();
    for (int i=0; i<=2; i++) {
      a = aux[i][0]+f.posicion[0];
      b = aux[i][1]+f.posicion[1];
      mapa [f.posicion[1]][f.posicion[0]]= f.getname();
      mapa[b][a] = f.getname();
      ;
    }
  }

  //pintamos en el canvas el mapa de acuerdo a la matriz
  void paint() {
    for (int fila = 0; fila < mapa.length; fila++) {
      for (int columna = 0; columna < mapa[0].length; columna++) {
        stroke(250); 
        if (mapa[fila][columna] == 0) {        
          fill(0, 0, 0);
          cuadrado(columna, fila);
        }
        if (mapa[fila][columna] == 1) {        
          fill(255, 0, 0);
          cuadrado(columna, fila);
        }
        if (mapa[fila][columna] == 2) {        
          fill(0, 255, 0);
          cuadrado(columna, fila);
        }
        if (mapa[fila][columna] == 3) {        
          fill(0, 255, 255);
          cuadrado(columna, fila);
        }
        if (mapa[fila][columna] == 4) {        
          fill(0, 0, 255);
          cuadrado(columna, fila);
        }
        if (mapa[fila][columna] == 5) {        
          fill(255, 128, 0);
          cuadrado(columna, fila);
        }
        if (mapa[fila][columna] == 6) {        
          fill(255, 255, 0);
          cuadrado(columna, fila);
        }
        if (mapa[fila][columna] == 7) {        
          fill(87, 35, 100);
          cuadrado(columna, fila);
        }
      }
    }
  }


  //rectificamos cuando haya una fila llena
  boolean fila_llena(int[] m) {
    for (int i = 0; i<10; i++) {
      if (m[i]==0) {
        return false;
      }
    }
    return true;
  }

  //borramos las filas que esten llenas
  void borra_fila (int f) {
    for (int i = f; i>0; i--) {
      for (int j = 0; j<10; j++) {
        mapa[i][j] = mapa[i-1][j];
      }
    }
    for (int k = 0; k<10; k++) {
      mapa[0][k] = 0;
    }
  }


  //actualiza la matriz quitando las filas llenas
  void actualizar_mapa() {
    for (int i = 0; i<=18; i++) {
      if (fila_llena(this.getmapa()[i])) {
        this.borra_fila(i);

        juego.cambio_puntaje(1000);  
        juego.cambio_puntajeln(1);
        juego.estniveles();
      }
    }
  }

  void cuadrado(int x, int y) {
    rect(32 * x + width/2-150, 32 * y + height/2-320, 32, 32);
  }
}
