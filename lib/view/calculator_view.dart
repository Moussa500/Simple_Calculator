import 'package:calculator/view/tools/button.dart';
import 'package:calculator/view/tools/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            displayResult(),
            Expanded(
              child: GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 4,
                children: [
                  OperationButton(
                    label: '%',
                    onTap: () => opController.readOperation('%'),
                  ),
                  OperationButton(
                      label: 'C',
                      onTap: () {
                        opController.clearOperation();
                      }),
                  OperationButton(
                      label: '<-',
                      onTap: () {
                        opController.dropLast();
                      }),
                  const ArithmeticOperationButton(
                    label: '/',
                  ),
                  const DigitButton(
                    label: '7',
                  ),
                  const DigitButton(
                    label: '8',
                  ),
                  const DigitButton(
                    label: '9',
                  ),
                  const ArithmeticOperationButton(
                    label: '*',
                  ),
                  const DigitButton(
                    label: '4',
                  ),
                  const DigitButton(
                    label: '5',
                  ),
                  const DigitButton(
                    label: '6',
                  ),
                  const ArithmeticOperationButton(
                    label: '-',
                  ),
                  const DigitButton(
                    label: '1',
                  ),
                  const DigitButton(
                    label: '2',
                  ),
                  const DigitButton(
                    label: '3',
                  ),
                  const ArithmeticOperationButton(
                    label: '+',
                  ),
                  OperationButton(
                    label: '+/-',
                    onTap: () {
                      String last = opController.operation.operation.last;
                      opController.operation.operation.last ='-$last';
                    },
                  ),
                  const DigitButton(
                    label: '0',
                  ),
                  OperationButton(
                    label: ',',
                    onTap: () => opController.readOperation('.'),
                  ),
                  const EqualButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container displayResult() {
    return Container(
            color: buttonColor,
            width: Get.width,
            height: Get.height * 0.25,
            child: Obx(() => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(opController.operation.operation.join(),style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),),
            )),
          );
  }
}
