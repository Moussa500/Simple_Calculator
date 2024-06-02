import 'package:calculator/controller/controller.dart';
import 'package:calculator/view/tools/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final OperationController opController = OperationController();
final ValidateController validate = ValidateController();

class DigitButton extends StatelessWidget {
  final String label;
  const DigitButton({
    required this.label,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: () => opController.readOperation(label),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
    );
  }
}

class OperationButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  const OperationButton({
    required this.label,
    required this.onTap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
    );
  }
}
class ArithmeticOperationButton extends StatelessWidget {
  final String label;
  const ArithmeticOperationButton({
    required this.label,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: () => opController.readOperation(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: const CircleBorder(),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 35, color: Colors.white),
        ),
      ),
    );
  }
}

class EqualButton extends StatelessWidget {
  const EqualButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: () {
          String input = opController.operation.operation.join();
          if (!validate.validateOperation(input)) {
            Get.dialog( AlertDialog(content:const Text('please enter a valid operation'),actions: [ElevatedButton(onPressed: ()=>Get.back(), child:const Text('back'))],));
          } else {
            String result = opController.calculate();
            opController.clearOperation();
            opController.readOperation(result);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: const CircleBorder(),
        ),
        child: const Text(
          '=',
          style: TextStyle(fontSize: 35, color: Colors.white),
        ),
      ),
    );
  }
}
