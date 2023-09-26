import 'package:flutter/material.dart';
import 'package:flutter_imc/controller/home_controller.dart';
import 'package:flutter_imc/data/database/shered_database.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_imc/main.dart';

void main() {
  Controller controllerTest = Controller(sharedDatabase: SharedDatabase());
  test('Testar niveis de IMC', () {
    Map<double, String> valueTest = {
      16: 'Muito abaixo do peso',
      18: 'Abaixo do peso',
      22: 'Peso ideal',
      26: 'Acima do peso',
      32.7: 'Obesidade I',
      37: 'Obesidade II (severa)',
      50: 'Obesidade III (mórbida)',
    };
    valueTest.forEach((key, value) {
      controllerTest.getResponse(key);
      expect(controllerTest.getResponse(key), value);
    });
  });

  test('Testar filtro do formulário', () {
    expect(controllerTest.pesoValidator('ahe7525d'), isNotNull);
    expect(controllerTest.pesoValidator('60'), null);
    expect(controllerTest.alturaValidator('aaaaa7585'), isNotNull);
    expect(controllerTest.alturaValidator('1.70'), null);
  });
}
