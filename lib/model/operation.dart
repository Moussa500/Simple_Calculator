import 'package:eval_ex/expression.dart';
import 'package:get/get.dart';
import 'package:string_validator/string_validator.dart';

class Operation {
  List operation = <String>[].obs;
  readOperation(String x) {
    if (operation.isNotEmpty) {
      if (operation.last.toString().isNumeric && x.isNumeric) {
        operation.last = operation.last + x;
      } else {
        operation.add(x);
      }
    } else {
      operation.add(x);
    }
  }

  clearOperation() => operation.clear();
  dropLast() {
    if (operation.isNotEmpty) {
      String str = operation.last;
      if (str.length > 1) {
        operation.last = str.substring(0, str.length - 1);
      } else {
        operation.removeLast();
      }
    }
  }

  calculate() {
    Expression input = Expression(operation.join());
    String result = input.eval().toString();
    return result.toString();
  }
}

class Validate {
  final RegExp expression = RegExp(r"(\d+\.?\d*)\s*([\+\-\*/%])\s*(\d+\.?\d*)");

  bool validate(String input) {
    if (!expression.hasMatch(input)) {
      return false;
    } else {
      return true;
    }
  }
}
