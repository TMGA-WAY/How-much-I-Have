import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travels, leisure, work }

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travels: Icons.flight,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

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

  String get formattedDate {
    return formatter.format(date);
  }
}
