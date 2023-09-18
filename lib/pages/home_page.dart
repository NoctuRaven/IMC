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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IMC APP')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
            style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
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
          const SizedBox(
            height: 20,
          ),
          Text(controller.stringResponse),
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
                      controller.peso = double.tryParse(newValue!);
                    },
                    validator: controller.pesoValidator,
                    decoration: const InputDecoration(hintText: "Peso:"),
                  ),
                  TextFormField(
                    onSaved: (newValue) {
                      controller.altura = double.tryParse(newValue!);
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
