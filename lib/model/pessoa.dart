class Pessoa {
  String? _nome;
  double? _peso;
  double? _altura;
  Pessoa({
    String? nome,
    double? peso,
    double? altura,
  }) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }

  getName() {
    return _nome;
  }

  getPeso() {
    return _peso;
  }

  getAltura() {
    return _altura;
  }

  setName(String nome) {
    _nome = nome;
  }

  setPeso(double peso) {
    _peso = peso;
  }

  setAltura(double altura) {
    _altura = altura;
  }
}
