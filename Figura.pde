abstract class figura { 

  //atributos 
  int gravedad=60;
  int gravedad_actual=60;
  protected int[] posicion= new int[2];
  int[][] auxiliar =new int[3][3];
  color relleno;
  abstract int getname(); 
  abstract color getrelleno();
  abstract int[][] getauxiliar();
  abstract void rotar();


  // The Constructor 

  figura(int x, int y) { 
    this.posicion[0]=x;
    this.posicion[1]=y;
  }

  //metodos
  //metodos abstracto
  abstract void setrelleno(color r);
  //cambiar y aumentar coordenadas x,y.
  int getx() {
    return this.posicion[0];
  }

  int gety() {
    return this.posicion[1];
  }
  void setposx(int t) {
    this.posicion[0]+=t;
  }
  void setposy(int t) {
    this.posicion[1]+=t;
  }
  void camby(int t) {
    this.posicion[1]=t;
  }
  void cambx(int t) {
    this.posicion[0]=t;
  }

  //restablece las coordenadas
  void rest() {
    this.posicion[0]=4;
    this.posicion[1]=1;
  }

  //limites
  int[] limites() {
    int[] l=new int[3];
    int[][] aux=this.getauxiliar();
    int [] x=new int[3];
    int [] y=new int[3];
    for (int i=0; i<=2; i++) {
      x[i]=aux[i][0];
      y[i]=aux[i][1];
    }
    x=sort(x);
    y=sort(y);

    l[2]=x[2];//derecho
    l[1]=x[0];//izquierdo
    l[0]=y[2];//inferior


    return l;
  }

  boolean limrota(Mapa m) {
    boolean f = false;
    int z=9;
    if (this.getname()==3) {
      z=8;
    }
    int[][] aux=this.getauxiliar();
    for (int i = 0; i<=2; i++) {
      if ( m.getmapa()[this.posicion[1]+aux[i][0]][this.posicion[0]+this.limites()[2]] != 0|| (this.posicion[0]+this.limites()[2]!= 9 && this.posicion[0]+this.limites()[2]!= z && this.posicion[0]+this.limites()[1]!=0)) {

        f= true;
      }
    }
    return f;
  }


  boolean limladod(Mapa m) {

    int[][] l=m.getmapa();
    int[][] aux =this.getauxiliar();
    if (l[this.posicion[1]][this.posicion[0]+1] != 0) {
      return false;
    }
    for (int i=0; i <=2; i++) {
      if (l[aux[i][1]+this.posicion[1]][aux[i][0]+this.posicion[0]+1] != 0) {
        return false;
      }
    }

    return true;
  }

  boolean limladoi(Mapa m) {

    int[][] l=m.getmapa();
    int[][] aux =this.getauxiliar();
    if (l[this.posicion[1]][this.posicion[0]-1] != 0) {
      return false;
    }
    for (int i=0; i <=2; i++) {
      if (l[aux[i][1]+this.posicion[1]][aux[i][0]+this.posicion[0]-1] != 0) {
        return false;
      }
    }

    return true;
  }


  //rectifica si se puede mover

  boolean quieto(Mapa m) {
    int[][] l=m.getmapa();
    int[][] aux =this.getauxiliar();
    if (l[this.posicion[1]+1][this.posicion[0]] != 0) {
      return true;
    }
    for (int i=0; i <=2; i++) {

      if (l[aux[i][1]+1+this.posicion[1]][aux[i][0]+this.posicion[0]] != 0) {
        return true;
      }
    }

    return false;
  }

  //rectifica hasta donde se puede mover la ficha invisible

  int inv(Mapa m) {
    for (int i = 0; i<m.getmapa().length; i++) {
      if (this.quieto(m)) {
        return this.posicion[1];
      } else {
        this.posicion[1]++;
      }
    }
    return this.posicion[1];
  }

  //cambia la gravedad
  void cambio_grav(int q) {
    this.gravedad=q;
  }

  //pinta la figura(el centro y los auxiliares)
  void paint() { 
    fill(this.getrelleno());
    cuadrado(this.posicion[0], this.posicion[1]); 
    for (int i = 0; i<3; i++) {
      auxiliar=this.getauxiliar();
      cuadrado(this.posicion[0]+this.auxiliar[i][0], this.posicion[1]+this.auxiliar[i][1]);
    }
  }

  //mueve la figura cada cierto tiempo hacia abajo 
  void move() {
    if (frameCount%gravedad==0) {
      this.setposy(1);
    }
  }    

  //base para pintar
  void cuadrado(int x, int y) {
    rect(32 * x + width/2-150, 32 * y + height/2-320, 32, 32);
  }
}



//objeto abs z,s
abstract class zs extends figura {
  //constructor
  zs(int x, int y) { 
    super(x, y);
  }
  //como rota las figuras s,z
  void rotar() {
    auxiliar[1][1]=-auxiliar[1][1];
    auxiliar[2][0]=-auxiliar[2][0];
  }
}


//objeto z
class z extends zs { 

  //atributos
  int name =1;
  color relleno=color(255, 0, 0);
  int[][] auxiliar={{-1, 0}, {0, 1}, {1, 1}};

  //constructor
  z(int x, int y) { 
    super(x, y);
  }

  //metodos
  int  getname() {
    return name;
  }
  void setrelleno( color r) {

    this.relleno=r;
  }
  color getrelleno() {
    return relleno;
  }
  int[][]  getauxiliar() {
    return this.auxiliar;
  }
}


//objeto s
class s extends zs { 
  int name =2;
  color relleno=color(0, 255, 0);
  int[][] auxiliar={{1, 0}, {0, 1}, {-1, 1}};

  s(int x, int y) { 
    super(x, y);
  }
  int  getname() {
    return name;
  }
  void setrelleno( color r) {

    this.relleno=r;
  }
  color getrelleno() {
    return relleno;
  }
  int[][]  getauxiliar() {
    return this.auxiliar;
  }
}
class i extends figura { 
  int name =3;
  color relleno=color(0, 255, 255);
  int[][] auxiliar={{-1, 0}, {1, 0}, {2, 0}};//{1,0},{0,-1},{1,1}

  // The Constructor is defined with arguments.

  i(int x, int y) { 
    super(x, y);
  }
  void rotar() {

    for (int i=0; i<=2; i++) {
      auxiliar[i]=reverse(auxiliar[i]);
    }
  }
  int[][]  getauxiliar() {
    return this.auxiliar;
  }
  int  getname() {
    return name;
  }
  void setrelleno( color r) {

    this.relleno=r;
  }
  color getrelleno() {
    return relleno;
  }
}
//objeto abs l,j
abstract class lj extends figura {
  lj(int x, int y) { 
    super(x, y);
  }

  void rotar() {
    for (int i=0; i<=2; i++) {
      auxiliar[i]=reverse(auxiliar[i]);
    }
    auxiliar[2][0]=-auxiliar[2][0];
  }
}
//objeto l
class l extends lj { 
  int name =5;
  color relleno=color(255, 128, 0);
  int[][] auxiliar={{0, -1}, {0, 1}, {-1, -1}};

  l(int x, int y) { 
    super(x, y);
  }
  int  getname() {
    return name;
  }
  void setrelleno( color r) {

    this.relleno=r;
  }
  color getrelleno() {
    return relleno;
  }
  int[][]  getauxiliar() {
    return this.auxiliar;
  }
}
//objeto j
class j extends lj { 
  int name =4;
  color relleno=color(0, 0, 255);
  int[][] auxiliar={{0, -1}, {0, 1}, {1, -1}};

  j(int x, int y) { 
    super(x, y);
  }
  int  getname() {
    return name;
  }
  void setrelleno( color r) {

    this.relleno=r;
  }
  color getrelleno() {
    return relleno;
  }
  int[][]  getauxiliar() {
    return this.auxiliar;
  }
}


//objeto l
class o extends figura { 
  int name =6;
  color relleno=color(255, 255, 0);
  int[][] auxiliar={{0, 1}, {1, 0}, {1, 1}};//{1,0},{0,-1},{1,1}

  // The Constructor is defined with arguments.

  o(int x, int y) { 
    super(x, y);
  }
  void rotar() {
  }

  int[][]  getauxiliar() {
    return this.auxiliar;
  }
  int  getname() {
    return name;
  }
  void setrelleno( color r) {

    this.relleno=r;
  }
  color getrelleno() {
    return relleno;
  }
}
class t extends figura { 
  int name =7;
  color relleno=color(87, 35, 100);
  int[][] auxiliar={{0, -1}, {0, 1}, {-1, 0}};//{1,0},{0,-1},{1,1}

  // The Constructor is defined with arguments.

  t(int x, int y) { 
    super(x, y);
  }
  void rotar() {
    for (int i=0; i<=2; i++) {
      auxiliar[i]=reverse(auxiliar[i]);
    }
    auxiliar[2][0]=-auxiliar[2][0];
  }
  int[][]  getauxiliar() {
    return this.auxiliar;
  }
  int  getname() {
    return name;
  }
  void setrelleno( color r) {

    this.relleno=r;
  }
  color getrelleno() {
    return relleno;
  }
}
