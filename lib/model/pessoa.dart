// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  Pessoa copyWith({
    String? nome,
    double? peso,
    double? altura,
  }) {
    return Pessoa(
      nome: _nome ?? this._nome,
      peso: _peso ?? this._peso,
      altura: _altura ?? this._altura,
    );
  }
}
