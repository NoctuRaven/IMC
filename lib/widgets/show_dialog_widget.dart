import 'package:flutter/material.dart';
import 'package:flutter_imc/controller/home_controller.dart';

class ShowDialogWidget extends StatefulWidget {
  final Controller controller;
  const ShowDialogWidget({super.key, required this.controller});

  @override
  State<ShowDialogWidget> createState() => _ShowDialogWidgetState();
}

class _ShowDialogWidgetState extends State<ShowDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Histórico'),
      content: Visibility(
        visible: widget.controller.pessoaList.isEmpty,
        replacement: SizedBox(
          height: 320,
          width: 320,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              itemCount: widget.controller.pessoaList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 35,
                            decoration: BoxDecoration(color: Colors.black),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.controller.sharedDatabase.removePessoa(
                                      widget.controller.pessoaList[index]);
                                  widget.controller.getListPessoa();
                                });
                              },
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: Text(
                                widget.controller.pessoaList[index].getName()),
                          ),
                        ],
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
                                  " Altura: ${widget.controller.pessoaList[index].getAltura()}"),
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
                                    " Altura: ${widget.controller.pessoaList[index].getPeso()}")),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Text(
                            "IMC: ${widget.controller.pessoaList[index].getIMC().toStringAsFixed(2)}"),
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
  }
}
