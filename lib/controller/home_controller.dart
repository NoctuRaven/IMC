// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../model/pessoa.dart';

enum Response { muitoAbaixo, abaixo, ideial, sobrepeso, muitoSubrepeso }

class Controller {
  double imcValue = 0.00;
  Response? pesoResponse;
  String stringResponse = 'Insira os valores no campo abaixo';
  Pessoa pessoa = Pessoa();

  Controller({
    this.pesoResponse,
  });

//   Abaixo de 17	Muito abaixo do peso
// Entre 17 e 18,49	Abaixo do peso
// Entre 18,5 e 24,99	Peso normal
// Entre 25 e 29,99	Acima do peso
// Entre 30 e 34,99	Obesidade I
// Entre 35 e 39,99	Obesidade II (severa)
// Acima de 40	Obesidade III (mórbida)

  getIMC() {
    if (pessoa != null) {
      imcValue =
          pessoa.getPeso()! / (pessoa.getAltura()! * pessoa.getAltura()!);
    }
    getResponse(imcValue);
  }

  getResponse(double imcValue) {
    if (imcValue < 17) {
      pesoResponse = Response.muitoAbaixo;
      stringResponse = 'Muito abaixo do peso';
    } else if (imcValue > 17 && imcValue < 18.49) {
      pesoResponse = Response.abaixo;
      stringResponse = 'Abaixo do peso';
    } else if (imcValue > 18.5 && imcValue < 24.99) {
      pesoResponse = Response.ideial;
      stringResponse = 'Peso ideal';
    } else if (imcValue > 25 && imcValue < 29.99) {
      pesoResponse = Response.sobrepeso;
      stringResponse = 'Acima do peso';
    } else if (imcValue > 30 && imcValue < 34.99) {
      pesoResponse = Response.muitoSubrepeso;
      stringResponse = 'Obesidade I';
    } else if (imcValue > 35 && imcValue < 39.99) {
      pesoResponse = Response.muitoSubrepeso;
      stringResponse = 'Obesidade II (severa)';
    } else if (imcValue > 40) {
      pesoResponse = Response.muitoSubrepeso;
      stringResponse = 'Obesidade III (mórbida)';
    }
    return stringResponse;
  }

  String getReaction() {
    switch (pesoResponse) {
      case Response.muitoAbaixo:
        return 'assets\\images\\triste.png';
      case Response.abaixo:
        return 'assets\\images\\meh.png';
      case Response.ideial:
        return 'assets\\images\\sorrir.png';
      case Response.sobrepeso:
        return 'assets\\images\\meh.png';
      case Response.muitoSubrepeso:
        return 'assets\\images\\triste.png';
      default:
        return 'assets\\images\\balanca.png';
    }
  }

  String? pesoValidator(value) {
    if (value!.isEmpty) {
      return "Insira o valor do peso";
    } else if (num.tryParse(value) == null) {
      return "Apenas valores numéricos são permitidos";
    } else {
      return null;
    }
  }

  String? alturaValidator(value) {
    if (value!.isEmpty) {
      return "Insira o valor do altura";
    } else if (num.tryParse(value) == null) {
      return "Apenas valores numéricos são permitidos";
    } else {
      return null;
    }
  }

  String? nameValidator(value) {
    if (value!.isEmpty) {
      return "Insira o seu nome";
    } else {
      return null;
    }
  }
}
