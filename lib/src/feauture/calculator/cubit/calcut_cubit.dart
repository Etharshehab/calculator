import 'package:calculator/src/feauture/calculator/cubit/calcut_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  String display = '0';
  double firstNumber = 0;
  double secondNumber = 0;
  String operator = '';
  bool shouldResetDisplay = false; // To reset display after result

  CalculatorCubit() : super(CalculatorInitial());

  // Update number on screen
  updateNumber(String number) {
    if (shouldResetDisplay) {
      display = number;
      shouldResetDisplay = false;
    } else {
      display = display == '0' ? number : display + number;
    }
    emit(CalculatorNumberUpdate());
  }

  // Store the operator and first number
  updateOperator(String selectedOperator) {
    firstNumber = double.parse(display);
    display = '0';
    operator = selectedOperator;
    emit(CalculatorOperatorUpdate());
  }

  // Perform calculation when '=' is pressed
  calculateResult() {
    secondNumber = double.parse(display);
    double result = 0.0;

    switch (operator) {
      case '+':
        result = firstNumber + secondNumber;
        break;
      case '-':
        result = firstNumber - secondNumber;
        break;
      case '×': // Fixed operator mismatch
        result = firstNumber * secondNumber;
        break;
      case '÷': // Fixed operator mismatch
        if (secondNumber != 0) {
          result = firstNumber / secondNumber;
        } else {
          display = "Error"; // Handle division by zero
          emit(CalculatorResultUpdate(diplay: display));
          return;
        }
        break;
      default:
        return;
    }

    display = result.toString();
    shouldResetDisplay = true; // Reset display for next input
    emit(CalculatorResultUpdate(diplay: display));
  }

  // Corrected percentage calculation
  calculatePercentage() {
    double number = double.parse(display);
    display = (number / 100).toString();
    emit(CalculatorResultUpdate(diplay: display));
  }

  // Reset Calculator
  resetCalculator() {
    display = '0';
    firstNumber = 0;
    secondNumber = 0;
    operator = '';
    shouldResetDisplay = false;
    emit(CalculatorInitial());
  }
}
