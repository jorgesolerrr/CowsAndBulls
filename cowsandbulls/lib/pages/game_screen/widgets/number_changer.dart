// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NumberChanger extends StatefulWidget {
  final Function(int, int) onChanger;
  final int index;

  const NumberChanger(
      {super.key, required this.index, required this.onChanger});

  @override
  State<NumberChanger> createState() => _NumberChangerState();
}

class _NumberChangerState extends State<NumberChanger> {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int selectedNumber = 0;
  
  

  void handleAddButton() {
    setState(() {
      selectedNumber++;
      selectedNumber = selectedNumber % numbers.length;
      widget.onChanger(widget.index, numbers[selectedNumber]);
    });
  }

  void handleRemoveButton() {
    setState(() {
      selectedNumber--;
      if (selectedNumber < 0) {
        selectedNumber = numbers.length - 1;
      }
      widget.onChanger(widget.index, numbers[selectedNumber]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(6.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                handleAddButton();
              },
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8)),
                  ),
                  fixedSize: const Size(50, 50),
                  backgroundColor: const Color.fromARGB(255, 94, 78, 43),
                  foregroundColor: Colors.white),
              child: const Icon(Icons.add),
            ),
            Container(
              width: 63,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  "${numbers[selectedNumber]}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                handleRemoveButton();
              },
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                  ),
                  fixedSize: const Size(50, 50),
                  backgroundColor: const Color.fromARGB(255, 94, 78, 43),
                  foregroundColor: Colors.white),
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
