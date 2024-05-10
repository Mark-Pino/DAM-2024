void main() {
  var ob = Heroex("Alexiño");
  print(ob.toString());
}

abstract class Personaje {
  String? poder;
  String nombre;

  // Constructor por defecto
  Personaje(this.nombre);

  @override
  String toString() {
    return "$nombre - $poder";
  }
}

class Heroex extends Personaje {
  int valentia = 100;

  Heroex(String nombre) : super(nombre);
}