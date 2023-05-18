import 'package:flutter/material.dart';

enum Status {
  negetiveStage,
  nutralStage,
  positiveStage,
}

class InteractiveModel {
  final String name;
  final TextEditingController message;
  double numStatus;

  Status get currStatus {
    if (numStatus > 50) {
      return Status.positiveStage;
    } else if (numStatus < 50) {
      return Status.negetiveStage;
    } else {
      return Status.nutralStage;
    }
  }

  InteractiveModel(
      {required this.name, required this.message, required this.numStatus});
}

class Item {
  final String name;
  bool isSelected;

  Item(this.name, this.isSelected);
}