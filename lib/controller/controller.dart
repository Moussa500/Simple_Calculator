import 'package:calculator/model/operation.dart';
import 'package:get/get.dart';

class OperationController extends GetxController {
  Operation operation = Operation();
  readOperation(String x) {
    operation.readOperation(x);
    print(operation.operation);
  }
  clearOperation() => operation.clearOperation();
  dropLast() => operation.dropLast();
  calculate() => operation.calculate();
}
class ValidateController extends GetxController {
  Validate validate = Validate();
  validateOperation(String input) => validate.validate(input);
}
