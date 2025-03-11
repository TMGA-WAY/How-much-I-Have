import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travels, leisure, work }

class Expense {
  final String id;
  final String title;
  final double cost;
  final DateTime date;
  final Category category;

  Expense(
      {required this.title,
      required this.cost,
      required this.date,
      required this.category})
      : id = uuid.v4(); // initailze value with custom values
}
