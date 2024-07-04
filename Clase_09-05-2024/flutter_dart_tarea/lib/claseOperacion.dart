class Operacionx {
  double suma(double a, double b) {
    return a + b;
  }

  double resta(double a, double b) {
    return a - b;
  }

  double multiplicacion(double a, double b) {
    return a * b;
  }
}

// Clase derivada que extiende Operacion
class OperacionDerivadax extends Operacionx {
  @override
  double suma(double a, double b) {
    // Implementación personalizada para la suma
    return (a + b) * 2;
  }

  @override
  double resta(double a, double b) {
    // Implementación personalizada para la resta
    return (a - b) * 2;
  }

  @override
  double multiplicacion(double a, double b) {
    // Implementación personalizada para la multiplicación
    return (a * b) * 2;
  }
}
