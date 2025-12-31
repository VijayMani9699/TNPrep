import 'package:flutter/material.dart';

class ExamCategory {
  final String title;
  final List<ExamItem> exams;

  ExamCategory({
    required this.title,
    required this.exams,
  });
}

class ExamItem {
  final String title;
  final String id;
  final Color? color;
  final Color? iconColor;
  final IconData? icon;

  ExamItem({
    required this.title,
    required this.id,
    this.color,
    this.iconColor,
    this.icon,
  });
}
