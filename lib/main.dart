import 'package:calculator/src/feauture/calculator/cubit/calcut_cubit.dart';
import 'package:calculator/src/feauture/calculator/view/screens/calcu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CalculatorCubit(),
        child: CalculatorScreen(),
      ),
    );
  }
}
