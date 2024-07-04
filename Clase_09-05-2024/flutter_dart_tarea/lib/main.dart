import 'package:flutter/material.dart';
import 'package:flutter_dart_tarea/claseOperacion.dart';
// import 'dart:io'; // Importa la librería para entrada y salida estándar

void main() {
  OperacionBasica operacion = OperacionBasica();

  double resultadoSuma = operacion.suma(5, 3);
  double resultadoResta = operacion.resta(10, 4);
  double resultadoMultiplicacion = operacion.multiplicacion(2, 6);

  print("Ejercicio 1 - Clase Abstracta Derivada");
  print('Resultado suma: $resultadoSuma'); // Resultado suma: 8.0
  print('Resultado resta: $resultadoResta'); // Resultado resta: 6.0
  print('Resultado multiplicacion: $resultadoMultiplicacion'); // Resultado multiplicacion: 12.0

  print("<----------------------------------------------------------->");

  print("Ejercicio 2 - Clase Extends Derivada");
  Operacionx operacionx = Operacionx();
  OperacionDerivadax operacionDerivadax = OperacionDerivadax();

  // Usando la clase Operacion
  print('Operación suma: ${operacionx.suma(5, 3)}'); // Resultado: 8.0
  print('Operación resta: ${operacionx.resta(10, 4)}'); // Resultado: 6.0
  print('Operación multiplicación: ${operacionx.multiplicacion(2, 6)}'); // Resultado: 12.0

  // Usando la clase OperacionDerivada
  print('Operación derivada suma: ${operacionDerivadax.suma(5, 3)}'); // Resultado: 16.0
  print('Operación derivada resta: ${operacionDerivadax.resta(10, 4)}'); // Resultado: 12.0
  print('Operación derivada multiplicación: ${operacionDerivadax.multiplicacion(2, 6)}'); // Resultado: 24.0
  print("<----------------------------------------------------------->");
  print("Nombre: Mark Roger Pino Chata");
}


abstract class Operacion {
  double suma(double a, double b);
  double resta(double a, double b);
  double multiplicacion(double a, double b);
}

class OperacionBasica extends Operacion {
  @override
  double suma(double a, double b) {
    return a + b;
  }

  @override
  double resta(double a, double b) {
    return a - b;
  }

  @override
  double multiplicacion(double a, double b) {
    return a * b;
  }
}
