import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
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
        title: "Flight",
        cost: 599.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "HP - Prisoner of Azkaban",
        cost: 98.99,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Dart",
        cost: 10.99,
        date: DateTime.now(),
        category: Category.work),
  ];

  void _openAddExpenseOperlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Text('Modla bottom Sheet'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOperlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Text('Expenses'),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
            ),
          )
        ],
      ),
    );
  }
}
