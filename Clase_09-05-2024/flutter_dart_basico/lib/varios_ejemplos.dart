import 'package:flutter/material.dart';
import 'package:flutter_dart_basico/04-listas.dart';
import 'package:flutter_dart_basico/ejclaseabstracta.dart';
import 'package:flutter_dart_basico/ejemploherencia.dart';

void main() {
  listasEjemplo();
}

void mainBol() {
  bool isActive = false;
  if (isActive == null) {
    print('isActive es null');
  } else {
    print('No es null');
  }
}

void mainOld() {
  var objH = Heroe(nombre: 'David');
  print(objH.toString());

  var dd = new Gato();
  dd.comer();

  var ob = Heroex("Raul");
  print(ob.toString());
}

void main01() {
// Strings
  String nombre = "Tony";
  final apellido = "Stark";
  nombre = 'Peter';
  print('$nombre $apellido');
// Números
  int empleados = 10;
  double salario = 1856.25;
  print(empleados);
  print(salario);
}

//Ejemplo de Clase
class Heroe {
  String nombre;
  String? poder;

  Heroe({required this.nombre});

  String toString() {
    return 'Heroe: nombre: ${this.nombre}';
  }
}
