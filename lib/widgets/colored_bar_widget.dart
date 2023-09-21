import 'package:flutter/material.dart';
import 'package:flutter_imc/controller/home_controller.dart';

class ColoredBarWidget extends StatelessWidget {
  Response? response;
  int? point;
  ColoredBarWidget({super.key, this.response});

  double getReaction() {
    switch (response) {
      case Response.muitoAbaixo:
        return 15;
      case Response.abaixo:
        return 65;
      case Response.ideial:
        return 115;
      case Response.sobrepeso:
        return 165;
      case Response.muitoSubrepeso:
        return 215;
      default:
        return 115;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 50,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(10),
                        topStart: Radius.circular(10))),
              ),
              Container(
                height: 5,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
              ),
              Container(
                height: 5,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
              ),
              Container(
                height: 5,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
              ),
              Container(
                height: 5,
                width: 50,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(10),
                        topEnd: Radius.circular(10))),
              ),
            ],
          ),
        ),
        // 15,65,115,165,215
        Positioned(
          top: 2,
          left: getReaction(),
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color.fromARGB(255, 0, 55, 100)),
          ),
        ),
      ],
    );
  }
}
