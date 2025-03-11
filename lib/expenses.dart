import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = <Expense>[
    Expense(
        title: "flutter",
        cost: 99.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Python",
        cost: 98.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Biryani",
        cost: 10.99,
        date: DateTime.now(),
        category: Category.food),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[Text('Expenses'), Text('Expense List')],
      ),
    );
  }
}
