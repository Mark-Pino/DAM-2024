void main() {

  var g=Gato();
  g.comer();
}


abstract class Animal{
  int? patas;

  void emitirSonido();

  void comer(){
    print("Comiendo....");
  }
}

class Perro implements Animal {

  int? patas;

  void emitirSonido()=>print("Guauauauauaua");

  void comer(){
    print("Comiendo el perro!");
  }
}

class Gato implements Animal {

  int? patas;
  int medidaCola=30;

  Gato();

  void emitirSonido()=>print("Miau digo guau");

  void comer(){
    print("Comiendo el gatoooo y tiene su cola de $medidaCola CM");
  }
}