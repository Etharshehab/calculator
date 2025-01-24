sealed class CalculatorState {}

final class CalculatorInitial extends CalculatorState {}

final class CalculatorNumberUpdate extends CalculatorState {}

final class CalculatorOperatorUpdate extends CalculatorState {}

final class CalculatorResultUpdate extends CalculatorState {
  final String diplay;
  CalculatorResultUpdate({required this.diplay});
}
