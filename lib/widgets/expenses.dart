import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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
        title: "Flutter",
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
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpenses,
      ),
    );
  }

  void _addExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpenses(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: const Text("Expense deleted."),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No Expense found. Start adding some!"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpenses,
      );
    }
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
      body: width < 600? Column(
        children: [Text('Expenses'), Expanded(child: mainContent)],
      ) : 
      Row(
              children: [Text('Expenses'), Expanded(child: mainContent)],
            )
      ,
    );
  }
}
