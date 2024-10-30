import 'package:cowsandbulls/pages/game_screen/tools/constants.dart';
import 'package:cowsandbulls/pages/game_screen/widgets/number_changer.dart';
import 'package:flutter/material.dart';

class NumberChangerList extends StatefulWidget {
  const NumberChangerList({super.key});

  @override
  State<NumberChangerList> createState() => _NumberChangerListState();
}

class _NumberChangerListState extends State<NumberChangerList> {
  List<int> selectedNumbers = List.filled(amountNumbers, 1);
  List<DataRow> tableRows = [];
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  late String numberToGuess;

  String _generateNumberToGuess() {
    numbers.shuffle();
    var numberToGuess = numbers.sublist(0, amountNumbers);
    print(numberToGuess.join());
    return numberToGuess.join();
  }

  @override
  void initState() {
    super.initState();
    numberToGuess = _generateNumberToGuess();
  }

  void _changeNumber(int index, int selectedNumber) {
    setState(() {
      selectedNumbers[index] = selectedNumber;
    });
  }

  void _handleTryButton() {
    setState(() {
      if (selectedNumbers.toSet().length != selectedNumbers.length) {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            content: const Text('All numbers must be distinct!'),
            backgroundColor: Colors.red,
            actions: [
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                },
                child: const Text('DISMISS',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
        return;
      }

      var bulls = 0;
      var cows = 0;



      for (var i = 0; i < amountNumbers; i++) {
        if (selectedNumbers[i] == int.parse(numberToGuess[i])) {
          bulls++;
        } else if (selectedNumbers.contains(int.parse(numberToGuess[i]))) {
          cows++;
        }
      }

      if (bulls == amountNumbers) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '🎉Congratulations!🎉',
            style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.green,
            ),
          ),
          content: const Text(
            'You won!',
            style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            TextButton(
          onPressed: () {
            _handleResetButton();
            Navigator.of(context).pop();
          },
          child: const Text(
            'DISMISS',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
            ),
          ],
        );
          },
        );
        return;
      }

      var value = selectedNumbers.join();

      tableRows.add(DataRow(cells: [
        DataCell(Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        )),
        DataCell(Text(" ${cows} 🐄 ${bulls} 🐂 ",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            )))
      ]));
    });
  }

  void _handleResetButton() {
    setState(() {
      tableRows = [];
      numberToGuess = _generateNumberToGuess();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            amountNumbers,
            (index) => NumberChanger(
              index: index,
              onChanger: _changeNumber,
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ElevatedButton(
              onPressed: () {
                _handleTryButton();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 94, 78, 43),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(children: [
                Text(
                  "Try!  ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
                Icon(Icons.send)
              ])),
          ElevatedButton(
              onPressed: () {
                _handleResetButton();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 94, 78, 43),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(children: [
                Text(
                  "Reset  ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
                Icon(Icons.replay_outlined)
              ]))
        ]),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              columns: const [
                DataColumn(
                    label: Text(
                  "Number",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                )),
                DataColumn(
                    label: Text(
                  "Result",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ))
              ],
              rows: tableRows,
            ),
          ),
        )
      ],
    );
  }
}
