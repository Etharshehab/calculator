import 'package:calculator/src/feauture/calculator/cubit/calcut_cubit.dart';
import 'package:calculator/src/feauture/calculator/cubit/calcut_state.dart';
import 'package:calculator/src/feauture/calculator/view/widget/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatelessWidget {
  final List<String> buttons = [
    'AC',
    '+/-',
    '%',
    '÷',
    '7',
    '8',
    '9',
    '×',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '=',
  ];

  CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<CalculatorCubit, CalculatorState>(
                builder: (context, state) {
                  final cubit = context.read<CalculatorCubit>();
                  return Text(
                    cubit.display,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 64,
                      fontWeight: FontWeight.w300,
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.0,
              ),
              itemCount: buttons.length,
              itemBuilder: (context, index) {
                return CalculatorButton(
                  text: buttons[index],
                  onPressed: () {
                    final cubit = context.read<CalculatorCubit>();
                    final button = buttons[index];

                    if (int.tryParse(button) != null || button == '.') {
                      cubit.updateNumber(button);
                    } else if (button == 'AC') {
                      cubit.resetCalculator();
                    } else if (button == '+' ||
                        button == '-' ||
                        button == '×' ||
                        button == '÷') {
                      cubit.updateOperator(button);
                    } else if (button == '=') {
                      cubit.calculateResult();
                    } else if (button == '%') {
                      cubit.calculatePercentage();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
