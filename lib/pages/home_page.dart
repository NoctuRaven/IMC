import 'package:flutter/material.dart';
import 'package:flutter_imc/controller/home_controller.dart';
import 'package:flutter_imc/widgets/colored_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _form = GlobalKey<FormState>();
  late Controller controller;

//   Abaixo de 17	Muito abaixo do peso
// Entre 17 e 18,49	Abaixo do peso
// Entre 18,5 e 24,99	Peso normal
// Entre 25 e 29,99	Acima do peso
// Entre 30 e 34,99	Obesidade I
// Entre 35 e 39,99	Obesidade II (severa)
// Acima de 40	Obesidade III (mórbida)

  @override
  void initState() {
    controller = Controller();
    super.initState();
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Histórico de IMC'),
          content: Visibility(
            visible: controller.pessoaList.isEmpty,
            replacement: SizedBox(
              height: 320,
              width: 320,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemCount: controller.pessoaList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: Text(controller.pessoaList[index].getName()),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                  ),
                                  child: Text(
                                      " Altura: ${controller.pessoaList[index].getAltura()}"),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                    ),
                                    child: Text(
                                        " Altura: ${controller.pessoaList[index].getPeso()}")),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            child: const Text("Não há registros "),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC APP'),
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () {
              _dialogBuilder(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 31, 86, 131)),
            child: const Text("Histórico"),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(width: 2.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(controller.getReaction()),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  controller.imcValue.toStringAsFixed(2),
                  style: const TextStyle(
                      fontSize: 60, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: 20,
                      width: 250,
                      child: ColoredBarWidget(
                        response: controller.pesoResponse,
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(controller.stringResponse),
          Visibility(
            visible: controller.pessoa.getName() != null,
            replacement: Container(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Olá ${controller.pessoa.getName()}, este é o resultado do seu IMC !'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2),
            ),
            child: Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (newValue) {
                      controller.pessoa.setName(newValue!);
                    },
                    validator: controller.nameValidator,
                    decoration: const InputDecoration(hintText: "Name:"),
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      controller.pessoa.setPeso(double.tryParse(newValue!)!);
                    },
                    validator: controller.pesoValidator,
                    decoration: const InputDecoration(hintText: "Peso:"),
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      controller.pessoa.setAltura(double.tryParse(newValue!)!);
                    },
                    validator: controller.alturaValidator,
                    decoration: const InputDecoration(hintText: "Altura:"),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_form.currentState!.validate()) {
                  _form.currentState!.save();
                  controller.addPessoaToList();
                  setState(() {
                    controller.getIMC();
                  });
                }
              },
              child: const Text('Calcular IMC'))
        ],
      ),
    );
  }
}
