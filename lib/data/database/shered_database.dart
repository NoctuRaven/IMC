import 'package:shared_preferences/shared_preferences.dart';

import '../../model/pessoa.dart';

class SharedDatabase {
  setPessoa(Pessoa pessoa) async {
    final shareDatabaseInstance = await SharedPreferences.getInstance();
    shareDatabaseInstance.setStringList(pessoa.getName(), [
      pessoa.getAltura().toString(),
      pessoa.getPeso().toString(),
      pessoa.getIMC().toString()
    ]);
    print("Pessoa adicionada: ${pessoa.getName()}");
  }

  removePessoa(Pessoa pessoa) async {
    final shareDatabaseInstance = await SharedPreferences.getInstance();
    shareDatabaseInstance.remove(pessoa.getName());
    print("Pessoa removida: ${pessoa.getName()}");
  }

  getListPessoa() async {
    final shareDatabaseInstance = await SharedPreferences.getInstance();
    final keys = shareDatabaseInstance.getKeys();
    List<Pessoa> listPessoa = [];
    for (var i in keys) {
      listPessoa.add(
        Pessoa(
          nome: i.toString(),
          altura: double.tryParse(shareDatabaseInstance.getStringList(i)![0]),
          peso: double.tryParse(shareDatabaseInstance.getStringList(i)![1]),
        ),
      );
    }
    return listPessoa;
  }
}
