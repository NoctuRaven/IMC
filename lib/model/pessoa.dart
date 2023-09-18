class Pessoa {
  String _nome;
  double _peso;
  double _altura;
  Pessoa(
    this._nome,
    this._peso,
    this._altura,
  );

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
